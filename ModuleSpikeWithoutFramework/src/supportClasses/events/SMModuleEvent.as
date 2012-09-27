package supportClasses.events
{
	import flash.events.Event;
	
	import supportClasses.SMModule;
	import supportClasses.model.ModuleViewVO;
	
	public class SMModuleEvent extends Event {
		
		public static const VIEW_CHANGING:String = "viewChanging";
		public static const VIEW_CHANGE:String = "viewChange";
		public static const VIEW_CANCEL_CHANGE:String = "viewCancelChange";
		public static const LOAD_MODULE:String = "loadModule";
		public static const MODULE_CREATION_COMPLETE:String = "moduleCreationComplete"
		public static const EXIT_MODULE:String = "exitModule";
		
		public var newState:String;
		public var oldState:String;
		public var oldModule:String;
		public var newModule:String;
		
		public function SMModuleEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=true)	{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			var ce:SMModuleEvent = new SMModuleEvent(type, bubbles, cancelable);
			ce.oldModule = oldModule;
			ce.newModule = newModule;
			ce.oldState = oldState;
			ce.newState = newState;
			return ce;
		}
	}
}