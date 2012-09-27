package cc.sitemaker.puremvc.shell.events
{
	import flash.events.Event;
	
	public class SMModuleEvent extends Event
	{
		public static const LOAD_MODULE:String = "loadModule";
		public static const UNLOAD_MODULE:String = "unloadModule";
		
		public var moduleUrl:String;
		
		public function SMModuleEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}