package cc.sitemaker.upload.model
{
	import cc.sitemaker.upload.UploadState;
	import cc.sitemaker.upload.model.vo.UploadVO;
	
	import flash.events.IEventDispatcher;
	import flash.net.FileReference;
	
	import mx.collections.ArrayList;

	public class UploadModel {
		
		private var _eventDispatcher:IEventDispatcher;
		
		public var uploads:ArrayList; 
		
		public function UploadModel(eventDispatcher:IEventDispatcher) {
			this._eventDispatcher = eventDispatcher; 
			
			uploads = new ArrayList();
		}
		
		/**
		 * Called from the UploadManager to add an upload to the list.
		 * Also returns the new UploadVO or if the UploadVO exists the 
		 * object from the model
		 *  
		 * @param fileRef:FileReference
		 * @return upload:UploadVO
		 * 
		 */		
		public function addUpload(fileRef:FileReference):UploadVO{
			var upload:UploadVO = getUploadByFileReference(fileRef);
		
			if (getUploadByFileReference(fileRef) == null){
				upload = new UploadVO();
				upload.fileRef = fileRef;
				uploads.addItem(upload);
				return upload;
			}
			
			return upload;
		}
		
		/**
		 * Get an UploadVO by FileReference. Simply returns the UploadVO
		 * object.
		 *   
		 * @param fileRef:FileReference
		 * @return upload:UploadVO
		 * 
		 */		
		public function getUploadByFileReference(fileRef:FileReference):UploadVO{
			for (var i:int = 0; i < uploads.length; i++){
				var upload:UploadVO = uploads.getItemAt(i) as UploadVO;
				if (upload.fileRef == fileRef)
					return upload;
			}
			
			return null;
		}
		
		/**
		 * Iterates over the uploads currently in the model, until it finds the next 
		 * Pending State then returns it. 
		 * Null is returned if there isnt any uploads in Pending State.
		 * 
		 * @return upload:UploadVO
		 * 
		 */		
		public function getNextPendingUpload():UploadVO {
			for (var i:int = 0; i < uploads.length; i++) {
				var upload:UploadVO = uploads.getItemAt(i) as UploadVO;
				if (upload.state == UploadState.PENDING)
					return upload;
			}
			
			return null;
		}
		
		/**
		 * Returns upload count based on a given UploadState.
		 *  
		 * @param state:UploadState
		 * @return count:Number
		 * 
		 */		
		public function getUploadCount(state:String):Number{
			var count:Number = 0;
			for (var i:int = 0; i < uploads.length; i++) {
				var upload:UploadVO = uploads.getItemAt(i) as UploadVO;
				if (upload.state == state)
					count++;
			}
			
			return count;
		}
	}
}