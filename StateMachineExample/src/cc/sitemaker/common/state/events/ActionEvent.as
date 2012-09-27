package cc.sitemaker.common.state.events
{
	import flash.events.Event;
	
	public class ActionEvent extends Event
	{
		public static var SUCCESS : String = "success";
		public static var FAILURE : String = "failure";
		public static var VALIDATION_ERROR : String = "validationError";
		
		public static var COMPLETE:Number = 6000;
		
		private var key:String;
		private var payload:Object;
		
		public function ActionEvent(source:Object,key:String,payload:Object) {
			this.type = ActionEvent.COMPLETE;
			this.source = source;
			key = key;
			payload = payload;
		}
		
		public function getKey():String{
			return key;
		}
		
		public function getPayload():Object{
			return payload;	
		}
		
		public function getAction():IAction{
			return IAction(source);	
		}
	}
}