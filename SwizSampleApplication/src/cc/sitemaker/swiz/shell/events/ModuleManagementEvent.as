package cc.sitemaker.swiz.shell.events
{
	import flash.events.Event;
	
	public class ModuleManagementEvent extends Event
	{
		public static const LOAD_MODULE:String = "loadModule";
		public static const UNLOAD_MODULE:String = "unloadModule";
		
		public var moduleUrl:String;
		
		public function ModuleManagementEvent(type:String, moduleUrl:String="",
											  bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.moduleUrl = moduleUrl;
		}
		
		override public function clone():Event{
			return new ModuleManagementEvent(type, moduleUrl, bubbles, cancelable);
		}
	}
}