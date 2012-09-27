package cc.sitemaker.social.event
{
	import flash.events.Event;
	
	public class FacebookEvent extends Event{
		
		public static const UPGRADED_NEEDED:String = "upgradeNeeded";
			
		public function FacebookEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)	{
			super(type, bubbles, cancelable);
		}
	}
}