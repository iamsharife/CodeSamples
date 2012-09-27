package cc.sitemaker.social.event
{
	import flash.events.Event;
	
	public class FacebookViewEvent extends Event {
		
		public static const OPEN_PAGES_PANEL:String = "FacebookViewEvent openPagesPanel";
		public static const CLOSE_PAGES_PANEL:String = "FacebookViewEvent closePagesPanel";
		public static const SELECT_PAGE_IN_UI:String = "FacebookViewEvent selectPageInUI";
		public static const SELECT_PAGE:String = "FacebookViewEvent selectPage";
		public static const UNASSOCIATE_FB_PAGE_FROM_SHOP:String = "FacebookViewEvent unassociateFbPageFromShop";
		
		public var pageId:String;
		
		public function FacebookViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			var fve:FacebookViewEvent = new FacebookViewEvent(type, bubbles, cancelable);
			fve.pageId = pageId;
			return fve; 
		}
	}
}