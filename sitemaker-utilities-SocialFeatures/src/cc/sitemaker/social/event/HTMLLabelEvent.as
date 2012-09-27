package cc.sitemaker.social.event
{
	import cc.sitemaker.social.model.vo.SocialPostVO;
	
	import flash.events.Event;
	
	public class HTMLLabelEvent extends Event {

		public static const LINK_CLICKED:String = "HTMLLabelEvent linkClicked";
		
		public var eventRequested:String;
		
		public function HTMLLabelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
	}
}