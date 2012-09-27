package cc.sitemaker.upload.events
{
	import cc.sitemaker.upload.interfaces.IUploadParent;
	import cc.sitemaker.upload.model.vo.UploadVO;
	
	import flash.events.Event;
	import flash.net.FileReference;
	
	public class UploadManagerEvent extends Event {
		
		public static const ALL_UPLOADS_COMPLETE:String = "UploadManagerEvent allUploadsComplete";
		public static const UPLOAD_ADDED:String = "UploadManagerEvent uploadAdded";
		public static const UPLOAD_COMPLETE:String = "UploadManagerEvent uploadComplete";
		public static const UPLOAD_FAILED:String = "UploadManagerEvent uploadFailed";
		public static const UPLOAD_CANCELLED:String = "UploadManagerEvent uploadCancelled";
		
		public static const UPLOAD_FILE:String = "UploadManagerEvent uploadFile";
		public static const CANCEL_UPLOAD:String = "UploadManagerEvent cancelUpload";
		
		public var uploadParent:IUploadParent;
		public var fileRef:FileReference;
		public var fileList:Vector.<FileReference>;
		public var upload:UploadVO;
		
		public function UploadManagerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			var ume:UploadManagerEvent = new UploadManagerEvent(type, bubbles, cancelable);
			ume.uploadParent = uploadParent;
			ume.fileRef = fileRef;
			ume.fileList = fileList;
			ume.upload = upload;
			return ume;
		}
	}
}