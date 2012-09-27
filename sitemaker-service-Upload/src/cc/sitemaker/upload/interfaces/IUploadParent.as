package cc.sitemaker.upload.interfaces
{
	import cc.sitemaker.upload.model.vo.UploadVO;

	public interface IUploadParent {
		
		function addUpload(upload:UploadVO):void;
		
		function onUploadComplete(upload:UploadVO):void;
		
		function onUploadProgress(upload:UploadVO):void;
		
		function onUploadFailed(upload:UploadVO):void;
		
		function getParentId():String;
	}
}