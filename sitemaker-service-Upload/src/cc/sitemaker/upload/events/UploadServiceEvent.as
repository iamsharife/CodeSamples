package cc.sitemaker.upload.events
{
	import cc.sitemaker.upload.model.vo.UploadVO;
	
	import flash.events.Event;
	
	public class UploadServiceEvent extends Event {
		
		public static const UPLOAD:String = "UploadServiceEvent upload";
		public static const UPLOAD_PROGRESS:String = "UploadServiceEvent uploadProgress";
		public static const UPLOAD_FAILED:String = "UploadServiceEvent uploadFailed";
		public static const UPLOAD_COMPLETE:String = "UploadServiceEvent uploadComplete";
		
		public var upload:UploadVO;
		
		public function UploadServiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
	}
}