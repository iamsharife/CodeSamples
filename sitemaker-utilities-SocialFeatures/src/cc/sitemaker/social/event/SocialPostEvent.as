package cc.sitemaker.social.event
{
	import cc.sitemaker.social.model.vo.SocialPostVO;
	
	import flash.events.Event;
	
	public class SocialPostEvent extends Event {

		public static const SHOW_SOCIAL_POST_PANEL:String = "SocialPostPanelEvent showSocialPostPanel";
		public static const HIDE_SOCIAL_POST_PANEL:String = "SocialPostPanelEvent hideSocialPostPanel";
		
		public static const CHECK_FACEBOOK_STATUS:String = "SocialPostPanelEvent checkFacebookStatus";
		public static const FACEBOOK_STATUS_CHANGE:String = "SocialPostPanelEvent facebookStatus";
		
		public static const FACEBOOK_LOGIN:String = "SocialPostPanelEvent facebookLogin";
		public static const FACEBOOK_LOGIN_RESULT:String = "SocialPostPanelEvent facebookLoginResult";
		public static const FACEBOOK_LOGIN_FAULT:String = "SocialPostPanelEvent facebookLoginFault";
		public static const FACEBOOK_LOGOUT:String = "SocialPostPanelEvent facebookLogout";
		public static const FACEBOOK_LOGOUT_RESULT:String = "SocialPostPanelEvent facebookLogoutResult";
		public static const FACEBOOK_LOGOUT_FAULT:String = "SocialPostPanelEvent facebookLogoutFault";

		public static const TWITTER_LOGIN:String = "SocialPostPanelEvent twitterLogin";
		public static const TWITTER_LOGIN_RESULT:String = "SocialPostPanelEvent twitterLoginResult";
		public static const TWITTER_LOGIN_FAULT:String = "SocialPostPanelEvent twitterLoginFault";
		public static const TWITTER_LOGOUT:String = "SocialPostPanelEvent twitterLogout";
		public static const TWITTER_LOGOUT_RESULT:String = "SocialPostPanelEvent twitterLogoutResult";
		public static const TWITTER_LOGOUT_FAULT:String = "SocialPostPanelEvent twitterLogoutFault";
		public static const TWITTER_VERIFY:String = "SocialPostPanelEvent twitterVerify";
		
		public static const POST_TO_SOCIAL:String = "SocialPostPanelEvent postToSocial";
		public static const POST_TO_SOCIAL_RESULT:String = "SocialPostPanelEvent postToSocialResult";
		public static const POST_TO_SOCIAL_FAULT:String = "SocialPostPanelEvent postToSocialFault";
		
		public var permissions:String;
		public var socialPost:SocialPostVO;
		public var toFacebook:Boolean;
		public var toFacebookSuccessful:Boolean;
		public var facebookMessage:String;
		public var toTwitter:Boolean;
		public var toTwitterSuccessful:Boolean;
		public var twitterMessage:String;
		public var error:String;
		public var errorEventType:String;
		
		public function SocialPostEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) {
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			var spe:SocialPostEvent = new SocialPostEvent(type, bubbles, cancelable);
			spe.permissions = permissions;
			spe.socialPost = socialPost;
			spe.toFacebook = toFacebook;
			spe.toFacebookSuccessful = toFacebookSuccessful;
			spe.facebookMessage = facebookMessage;
			spe.toTwitter = toTwitter;
			spe.toTwitterSuccessful = toTwitterSuccessful;
			spe.twitterMessage = twitterMessage;
			spe.error = error;
			spe.errorEventType = errorEventType;
			return spe; 
		}
	}
}