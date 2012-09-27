package supportClasses.events
{
	import flash.events.Event;
	
	import supportClasses.model.ViewVO;
	
	public class SMModuleEvent extends Event {
		
		public static const VIEW_CHANGING:String = "viewChanging";
		public static const VIEW_CHANGE:String = "viewChange";
		public static const VIEW_CANCEL_CHANGE:String = "viewCancelChange";
		public static const LOAD_MODULE:String = "loadModule";
		public static const EXIT_MODULE:String = "exitModule";
		
		public var newState:String;
		public var oldState:String;
		public var newModule:String;
		
		public function SMModuleEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=true)	{
			super(type, bubbles, cancelable);
		}
	}
}