package cc.sitemaker.upload.service
{
	import cc.sitemaker.upload.UploadState;
	import cc.sitemaker.upload.events.UploadServiceEvent;
	import cc.sitemaker.upload.model.vo.UploadVO;
		
	import flash.events.DataEvent;
	import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.utils.getTimer;

	public class UploadService {
		
		private var _eventDispatcher:IEventDispatcher;
		
		private var _upload:UploadVO;
		
		public var uploadInProgress:Boolean;
		
		public var rootUrl:String;
		
		public var mark:String;
		
		public var token:String;
		
		public function UploadService(eventDispatcher:IEventDispatcher) {
			this._eventDispatcher = eventDispatcher;
		}
		
		/**
		 * Gets the current upload the service is working on<br>
		 *  <br>
		 * @return upload:UploadVO 
		 */		
		public function getCurrentUpload():UploadVO {
			return _upload;
		}

		/**
		 * Called when the service is instructed to upload.<br>
		 *  <br>
		 * @param upload:UploadVO
		 */		
		public function uploadFile(upload:UploadVO):void{
			uploadInProgress = true;
			_upload = upload;
			addEventListeners();
			
			try {
				_upload.fileRef.upload(createRequest());
			} catch(error:Error) {
				onIOError(null);
			}
		}
			
		/**
		 * Called when the service is instructed to cancel the current upload 
		 */		
		public function cancelUpload():void{
			removeEventListeners();
			_upload.setState(UploadState.CANCELLED);
			_upload.fileRef.cancel();
			uploadInProgress = false;
			dispatchServiceEvent(UploadServiceEvent.UPLOAD_FAILED);
		}
		
		/**
		 * Add event listeners for Progress, Completion, Errors, or HTTPStatus 
		 */		
		private function addEventListeners():void{
			_upload.fileRef.addEventListener(ProgressEvent.PROGRESS, onProgress);
			_upload.fileRef.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, onComplete);
			_upload.fileRef.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			_upload.fileRef.addEventListener(HTTPStatusEvent.HTTP_STATUS, onStatus);
		}
		
		/**
		 * Remove event listeners for Progress, Completion, Errors, or HTTPStatus 
		 */		
		private function removeEventListeners():void{
			_upload.fileRef.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			_upload.fileRef.removeEventListener(DataEvent.UPLOAD_COMPLETE_DATA, onComplete);
			_upload.fileRef.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
			_upload.fileRef.removeEventListener(HTTPStatusEvent.HTTP_STATUS, onStatus);
		}
		
		/**
		 * Creates URLRequest, for the given upload.<br>
		 *  <br>
		 * @return request:URLRequest 
		 */		
		private function createRequest():URLRequest{
			var timeSt:String =  String (getTimer());
			
			// to be replaced
			var _rootURL:String = rootUrl;
			var mrk:String = mark;
			var tok:String = token;
			
			var path:String = _rootURL + "upload.cgi?todo=uploadFP8&mark=" + mrk +"&tok="+tok+"&ts="+timeSt;
			if (_upload.parent){
				path+="&parentID="+_upload.parent.getParentId();
			}
			
			var request:URLRequest = new URLRequest(path); 
			return request;
		}
		
		/**
		 * Event handler for progress of the upload<br>
		 *  <br>
		 * @param e:ProgressEvent
		 */		
		private function onProgress(e:ProgressEvent):void{
			// This is done to ensure that if the state has been changed, while the 
			// progress is updating, to force the cancellation
			if (_upload.state == UploadState.CANCELLED){
				cancelUpload();
			}
			
			_upload.setState(UploadState.IN_PROGRESS);
			_upload.bytesLoaded = e.bytesLoaded;
			_upload.bytesTotal = e.bytesTotal;
			dispatchServiceEvent(UploadServiceEvent.UPLOAD_PROGRESS);
		}
		
		/**
		 * Event handler for completion of the upload<br>
		 *  <br>
		 * @param e:DataEvent
		 */	
		private function onComplete(e:DataEvent):void{ 
			removeEventListeners();
			_upload.result = JSON.parse(e.text);
			uploadInProgress = false;
			_upload.setState(UploadState.COMPLETE);
			dispatchServiceEvent(UploadServiceEvent.UPLOAD_COMPLETE);
		}
		
		/**
		 * Event handler for failure of the upload<br>
		 *  <br>
		 * @param e:IOErrorEvent
		 */	
		private function onIOError(e:IOErrorEvent):void{
			removeEventListeners();
			_upload.setState(UploadState.FAILED, "Unable to upload");
			uploadInProgress = false;
			dispatchServiceEvent(UploadServiceEvent.UPLOAD_FAILED);
		}
		
		/**
		 * Event handler for failures or HTTPStatus of the upload<br>
		 *  <br>
		 * @param e:HTTPStatusEvent
		 */	
		private function onStatus(event:HTTPStatusEvent):void{
			removeEventListeners();
			var bodyError:String = "Unable to upload";
			switch (event.status){
				case 440 :
					//bodyError = "Database error";
					break 
				case 441 :
					//bodyError = "Filesystem error";
					break 
				case 442 :
					//bodyError = "Missing parameter";
					break 
				case 443 :
					//bodyError = "Invalid Session";
					break 
				case 445 :
					bodyError = "Image too big";
					break 
				case 446 :
					bodyError = "Quota exceeded";
					break 
				case 447 :
					//bodyError = "Failed conversion";
					break 
			}
			_upload.setState(UploadState.FAILED, bodyError);
			uploadInProgress = false;
			dispatchServiceEvent(UploadServiceEvent.UPLOAD_FAILED);
		}
		
		/**
		 * For convienence, the type of event is passed in, and 
		 * then a UploadManagerEvent is dispatched <br>
		 * <br>
		 * UploadServiceEvent.UPLOAD_PROGRESS<br>
		 * UploadServiceEvent.UPLOAD_COMPLETE<br>
		 * UploadServiceEvent.UPLOAD_FAILED<br>
		 * <br>
		 * @param type:String
		 */		
		private function dispatchServiceEvent(type:String):void{
			var uSe:UploadServiceEvent = new UploadServiceEvent(type);
			uSe.upload = _upload;
			_eventDispatcher.dispatchEvent(uSe);
		}
	}
}