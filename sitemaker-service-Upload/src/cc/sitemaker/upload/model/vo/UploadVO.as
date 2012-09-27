package cc.sitemaker.upload.model.vo
{
	import cc.sitemaker.upload.UploadState;
	import cc.sitemaker.upload.interfaces.IUploadParent;
	
	import flash.display.BitmapData;
	import flash.net.FileReference;
	
	import mx.events.PropertyChangeEvent;
	import mx.events.PropertyChangeEventKind;

	[Bindable]
	public class UploadVO {
		
		public var fileRef:FileReference;
		public var targetDir:String;
		public var bytesLoaded:Number=0;
		public var bytesTotal:Number=0;
		public var result:Object;
		public var parent:IUploadParent;
		
		public var state:String=UploadState.PENDING;
		public var info:String;
		
		public function get name():String{
			return fileRef.name;
		}
		
		public function set name(value:String):void{
			// not needed
		}
					
		public function setState(st:String, inf:String=""):void{
			this.state = st;
			this.info = inf;
			this.dispatchEvent(new PropertyChangeEvent(PropertyChangeEvent.PROPERTY_CHANGE, true, true, PropertyChangeEventKind.UPDATE, state, state, st, this));
		}
	}
}