package cc.sitemaker.social.view.mediators {
	
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.social.model.SocialModel;
	import cc.sitemaker.social.model.vo.SocialPostVO;
	import cc.sitemaker.social.view.components.TwitterContent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class TwitterContentMediator extends Mediator {
		
		[Inject]
		public var view:TwitterContent;
		
		[Inject]
		public var model:SocialModel;
		
		override public function onRegister():void{
			addContextListener(SocialPostEvent.TWITTER_LOGIN_RESULT, onTwitterLoginResult);
			addContextListener(SocialPostEvent.TWITTER_LOGIN_FAULT, onTwitterLoginFault);
			addContextListener(SocialPostEvent.TWITTER_LOGOUT_RESULT, onTwitterLogoutResult);
			
			eventMap.mapListener(view, "socialServiceSelected", onSelectedChange);
			eventMap.mapListener(view.signInOutButton, MouseEvent.CLICK, onSignInOutButtonClick);
			
			prepareView();
			updateTwitterStatus();
			verify();
		}
		
		private function prepareView():void {
			var socialPost:SocialPostVO = model.socialPost;
			view.messageArea.text = "I've just added " + socialPost.title + " to my shop. Take a look";
		}
		
		private function onSelectedChange(e:Event):void {
			view.socialContent.enabled = view.selected;
		}
		
		private function onSignInOutButtonClick(e:MouseEvent):void{
			if (model.isTWLoggedIn){
				logout();
			} else {
				view.selected = true;
				login();
			}
		}
		
		public function onTwitterLoginResult(e:SocialPostEvent):void {
			updateTwitterStatus();
		}
		
		public function onTwitterLoginFault(e:SocialPostEvent):void {
			updateTwitterStatus();
		}
		
		public function onTwitterLogoutResult(e:SocialPostEvent):void {
			updateTwitterStatus();
		}
		
		private function updateTwitterStatus():void{
			if (model.isTWLoggedIn){
				view.currentState = "loggedIn";
				view.lblUsername.text = model.twScreenName;
				view.profileImage.source = "http://api.twitter.com/1/users/profile_image?screen_name="+model.twScreenName+"&size=normal";
			} else {
				view.currentState = "notLoggedIn";
			}
		}
		
		private function verify():void{
			// dispatch event to login for selected item
			var socialEvent:SocialPostEvent = new SocialPostEvent(SocialPostEvent.TWITTER_VERIFY);
			dispatch(socialEvent);
		}
		
		private function login():void{
			// dispatch event to login for selected item
			var socialEvent:SocialPostEvent = new SocialPostEvent(SocialPostEvent.TWITTER_LOGIN);
			dispatch(socialEvent);
		}
		
		private function logout():void{
			var socialEvent:SocialPostEvent = new SocialPostEvent(SocialPostEvent.TWITTER_LOGOUT);	
			dispatch(socialEvent);
		}
	}
}