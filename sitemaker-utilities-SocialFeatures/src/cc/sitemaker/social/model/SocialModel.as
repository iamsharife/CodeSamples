package cc.sitemaker.social.model
{
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.social.model.vo.FacebookPageVO;
	import cc.sitemaker.social.model.vo.SocialPostVO;
	
	import com.facebook.graph.data.FacebookAuthResponse;
	import com.facebook.graph.data.FacebookSession;
	
	import org.robotlegs.mvcs.Actor;
	
	public class SocialModel extends Actor{
		
		public var socialPost:SocialPostVO;
		
		/*
		* FACEBOOK 
		*/		
		
		public var fbAppID:String;
		
		public var isFBLoggedIn:Boolean;
		
		public var fbSession:FacebookAuthResponse;
		
		public var fbFullname:String;
		
		public var fbLoginStatus:String;
		
		public var fbPages:Array;
		
		public function getFacebookPageVOById(pageId:String):FacebookPageVO{
			if (fbPages != null){
				for (var i:int = 0; i < fbPages.length; i++){
					if (fbPages[i].id == pageId){
						return fbPages[i] as FacebookPageVO;
					}
				}
			}
			return null;			
		}
		/*
		* TWITTER 
		*/		
		
		public var isTWLoggedIn:Boolean;
		
		public var twScreenName:String;
		
	}
}