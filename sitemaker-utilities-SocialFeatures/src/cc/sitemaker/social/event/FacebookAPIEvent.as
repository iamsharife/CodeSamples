package cc.sitemaker.social.event
{
	import flash.events.Event;
	
	public class FacebookAPIEvent extends Event {
		
		public static const GET_PAGE_DETAIL:String = "FacebookAPIEvent getPageDetail";
		public static const GET_PAGE_DETAIL_RESULT:String = "FacebookAPIEvent getPageDetailResult";
		public static const GET_PAGE_DETAIL_FAULT:String = "FacebookAPIEvent getPageDetailFault";
		
		public static const GET_PAGES:String = "FacebookAPIEvent getPages";
		public static const GET_PAGES_RESULT:String = "FacebookAPIEvent getPagesResult";
		public static const GET_PAGES_FAULT:String = "FacebookAPIEvent getPagesFault";

		public static const ADD_SHOP_TO_FACEBOOK_PAGE:String = "FacebookAPIEvent addShopToFacebookPage";
		public static const ADD_SHOP_TO_FACEBOOK_PAGE_RESULT:String = "FacebookAPIEvent addShopToFacebookPageResult";
		public static const ADD_SHOP_TO_FACEBOOK_PAGE_FAULT:String = "FacebookAPIEvent addShopToFacebookPageFault";
		
		public static const GET_TAB_NAME:String = "FacebookAPIEvent getTabName";
		public static const GET_TAB_NAME_RESULT:String = "FacebookAPIEvent getTabNameResult";
		public static const GET_TAB_NAME_FAULT:String = "FacebookAPIEvent getTabNameFault";
		
		public static const UPDATE_TAB_NAME:String = "FacebookAPIEvent updateTabName";
		public static const UPDATE_TAB_NAME_RESULT:String = "FacebookAPIEvent updateTabNameResult";
		public static const UPDATE_TAB_NAME_FAULT:String = "FacebookAPIEvent updateTabNameFault";

		public var pageId:String;
		public var tabName:String;
		
		public function FacebookAPIEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
	}
}