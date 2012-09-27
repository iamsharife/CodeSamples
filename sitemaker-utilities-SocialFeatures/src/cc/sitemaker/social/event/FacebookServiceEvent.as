package cc.sitemaker.social.event
{
	import flash.events.Event;
	
	public class FacebookServiceEvent extends Event
	{
		public static const CHECK_STATUS:String = "checkFacebookAPIStatus";
		public static const CHECK_STATUS_LOADED:String = "checkFacebookAPILoaded";
		
		public static const CHECK_NOTE_PERMISSION:String = "checkFacebookNotePermission";
		public static const CHECK_NOTE_PERMISSION_LOADED:String = "checkFacebookNotePermissionLoaded";
		
		public static const LOAD_API:String = "loadFacebookAPI";
		public static const API_LOADED:String = "facebookAPILoaded";
		
		public static const SAVE_API:String = "saveFacebookAPI";
		public static const API_SAVE_ERROR:String = "facebookAPISaveError";
		public static const API_SAVED:String = "facebookAPISaved";
		public static const REMOVE_API:String = "removeFacebookAPI";
		
		public static const POST_NOTE:String = "postFacebookNote";
		public static const POSTED_NOTE:String = "postedFacebookNote";
		public static const POST_NOTE_ERROR:String = "postFacebookNoteError";
		
		public static const SAVE_ENABLED:String = "saveFacebookEnabled";
		
		// new const to reflect GraphAPI Behavior 
		public static const FACEBOOK_LOGGED:String = "logged in facebook";
		public static const FACEBOOK_LOG_FAILURE:String = "facebook logging failure";
		
		public var appId:String;
		public var secret:String;
		public var errorCode:Number;
		public var ok:Number; // used by checkFacebookNotePermission
		public var enabled:Boolean;
		
		public var subject:String;
		public var body:String;
		
		public function FacebookServiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}
