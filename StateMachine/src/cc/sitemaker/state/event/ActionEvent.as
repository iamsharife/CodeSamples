package cc.sitemaker.state.event
{
	import flash.events.Event;
	
	public class ActionEvent extends Event {
		
		public function ActionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)	{
			super(type, bubbles, cancelable);
		}
		
		
	}
}