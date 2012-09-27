package cc.sitemaker.common.flow
{
	import flash.events.Event;
	
	public class ActionEvent extends Event	{
		
		public static const SUCCESS:String = "success";
		public static const FAILURE:String = "failure";
		
		public static const PERFORM:String = "perform";
		public static const COMPLETE:String = "complete";
		
		public var outcome:String;
		public var actionId:String;
		
		public function ActionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
	}
}