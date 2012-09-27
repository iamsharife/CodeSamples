package cc.sitemaker.upload.manager
{
	import cc.sitemaker.upload.UploadState;
	import cc.sitemaker.upload.events.UploadManagerEvent;
	import cc.sitemaker.upload.events.UploadServiceEvent;
	import cc.sitemaker.upload.interfaces.IUploadParent;
	import cc.sitemaker.upload.model.UploadModel;
	import cc.sitemaker.upload.model.vo.UploadVO;
	import cc.sitemaker.upload.service.UploadService;
	
	import flash.events.IEventDispatcher;
	import flash.net.FileReference;
 
	public class UploadManager {
		
		private var _eventDispatcher:IEventDispatcher;
		
		private var _moduleEventDispatcher:IEventDispatcher;
		
		private var _model:UploadModel;
		
		private var _service:UploadService;
		
		/**
		 * UploadManager requires shared eventDispatcher, optional params are upload model and upload service
		 * Otherwise, they are insantiated internally to this class. <br>
		 *  <br>
		 * @param eventDispatcher
		 * @param model
		 * @param service
		 */		
		public function UploadManager(eventDispatcher:IEventDispatcher, model:UploadModel=null, service:UploadService=null) {
			this._eventDispatcher = eventDispatcher;
			this._model = (model) ? model : new UploadModel(eventDispatcher);
			this._service = (service) ? service : new UploadService(eventDispatcher);
			
			addEventListeners();
		} 
		
		public function get moduleEventDispatcher():IEventDispatcher {
			return _moduleEventDispatcher;
		}

		public function set moduleEventDispatcher(value:IEventDispatcher):void {
			_moduleEventDispatcher = value;
		}

		public function getModel():UploadModel {
			return _model;
		}

		/**
		 * Called when you have a list of FileReferences to upload
		 * This function iterates over list and calls uploadFile<br>
		 * <br> 
		 * @param files:Vector.<FileReference>
		 * 
		 */		
		public function uploadFiles(files:Vector.<FileReference>, uploadParent:IUploadParent=null):void{
			for (var i:int = 0; i < files.length; i++) {
				var fileRef:FileReference = files[i] as FileReference;
				uploadFile(fileRef, uploadParent);
			}
		}
		
		/**
		 * Invalidates the model and removes all uploads from the list.
		 * This function assumes any checks you require to do have been made, 
		 * If called without conditional logic, will remove items and items are lost.
		 */		
		public function clearUploadList():void{
			// need to change this so that is the responsiblity of the model to do so.
			if (_service.uploadInProgress == false)
				_model.uploads.removeAll();
		}
		
		/**
		 * Called when there is a single upload
		 *  <br>
		 * @param fileRef:FileReference
		 */		
		public function uploadFile(fileRef:FileReference, uploadParent:IUploadParent=null):void{
			
			// add upload to model, and pass to local variable
			var upload:UploadVO = _model.addUpload(fileRef);
			upload.parent = uploadParent;
			
			uploadParent.addUpload(upload);
						
			// if the service isnt currently uploading, then initiate the upload
			if (_service.uploadInProgress == false && upload.state == UploadState.PENDING){
				_service.uploadFile(upload);
			} else {
				// assumption here is that there is nothing to upload and it is all complete
				//dispatchEvent(UploadManagerEvent.ALL_UPLOADS_COMPLETE);
			}
			
			dispatchEvent(UploadManagerEvent.UPLOAD_ADDED, upload);
		}
		
		/**
		 * Called when a specific upload needs to be cancelled.
		 * If the upload is currently being uploaded by the service,
		 * it will cancel the upload. Otherwise, it will set the state of 
		 * model item to UploadState.CANCELLED. If the this state is set, 
		 * when the nextUpload method is called if its cancelled, it will bypass.<br>
		 *  <br>
		 * @param fileRef:FileReference
		 */		
		public function cancelUpload(fileRef:FileReference):void{
			// get the upload using the fileRef
			var upload:UploadVO = _model.getUploadByFileReference(fileRef);
			// if the upload is currently in the service class, then call cancel
			// Otherwise, set the state to UploadState.CANCELLED.
			if (upload == _service.getCurrentUpload()){
				_service.cancelUpload();	
			} else {
				upload.setState(UploadState.CANCELLED);
			}
			dispatchEvent(UploadManagerEvent.UPLOAD_CANCELLED, upload);
		}
		
		/**
		 * Register interest in the UploadServiceEvent.UPLOAD_COMPLETE, and 
		 * UploadServiceEvent.UPLOAD_FAILED so that nextUpload can be called
		 * and an UploadManagerEvent is dispatched. UploadManagerEvent should be interest
		 * for the outside world, instead of listening for UploadServiceEvent.
		 */		
		private function addEventListeners():void{
			// listener for upload complete, so that the nextupload can be initiated
			this._eventDispatcher.addEventListener(UploadServiceEvent.UPLOAD_COMPLETE, onUploadComplete);
			this._eventDispatcher.addEventListener(UploadServiceEvent.UPLOAD_PROGRESS, onUploadProgress);
			this._eventDispatcher.addEventListener(UploadServiceEvent.UPLOAD_FAILED, onUploadFailed);
		}
		
		/**
		 * Handler for when an upload has complete from the service
		 * UploadManagerEvent is dispatched, this should be the interest
		 * for the outside world. NOT UploadServiceEvent<br>
		 * <br>
		 * @param e:UploadServiceEvent
		 */		
		private function onUploadComplete(e:UploadServiceEvent):void{
			// have access to the upload, so use the parent interface 
			// to notify the object its failed
			if (e.upload.parent != null)
				e.upload.parent.onUploadComplete(e.upload);
			
			dispatchEvent(UploadManagerEvent.UPLOAD_COMPLETE, e.upload);
			// upload has either completed or failed for some reason,
			// so start the next pending file
			nextUpload();
		}
		
		/**
		 *
		 */		
		private function onUploadProgress(e:UploadServiceEvent):void{
			// have access to the upload, so use the parent interface 
			// to notify the object its progress
			if (e.upload.parent != null)
				e.upload.parent.onUploadProgress(e.upload);
		}
		
		/**
		 * Handler for when an upload has failed from the service
		 * UploadManagerEvent is dispatched, this should be the interest
		 * for the outside world. NOT UploadServiceEvent.<br>
		 * <br>
		 * @param e:UploadServiceEvent
		 */	
		private function onUploadFailed(e:UploadServiceEvent):void {
			// have access to the upload, so use the parent interface 
			// to notify the object its failed
			if (e.upload.parent != null)
				e.upload.parent.onUploadFailed(e.upload);
			
			dispatchEvent(UploadManagerEvent.UPLOAD_FAILED, e.upload);
			// upload has either completed or failed for some reason,
			// so start the next pending file
			nextUpload();
		}
		
		/**
		 * Called when the next upload is to be uploaded.
		 * Gets the next pending upload and instructs the service to upload it. 
		 */		
		private function nextUpload():void{
			// get the next upload which is in UploadState.PENDING state.
			var upload:UploadVO = _model.getNextPendingUpload();
			if (upload)
				_service.uploadFile(upload);
			else 
				//dispatch event to notify that there are no more uploads left to do
				dispatchEvent(UploadManagerEvent.ALL_UPLOADS_COMPLETE);
		}
		
		/**
		 * For convienence, the type of event is passed in, and the upload is
		 * passed in.
		 * Then a UploadManagerEvent is dispatched <br>
		 * <br>
		 * UploadManagerEvent.UPLOAD_FAILED<br>
		 * UploadManagerEvent.UPLOAD_COMPLETE<br>
		 * UploadManagerEvent.UPLOAD_ADDED<br>
		 * UploadManagerEvent.ALL_UPLOADS_COMPLETE<br>
		 * <br>
		 * @param type:String
		 * @param upload:UploadVO
		 */		
		private function dispatchEvent(type:String, upload:UploadVO=null):void{
			var ume:UploadManagerEvent = new UploadManagerEvent(type);
			ume.upload = upload;
			// dispatch for the context dispatcher, as well as the moduleDispatcher to notify other modules
			_eventDispatcher.dispatchEvent(ume);
			_moduleEventDispatcher.dispatchEvent(ume);
		}
		
	}
}