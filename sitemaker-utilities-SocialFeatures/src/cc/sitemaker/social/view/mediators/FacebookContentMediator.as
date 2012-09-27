package cc.sitemaker.social.view.mediators
{
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.social.model.SocialModel;
	import cc.sitemaker.social.model.vo.SocialPostVO;
	import cc.sitemaker.social.view.components.FacebookContent;
	
	import com.facebook.graph.Facebook;
	import com.facebook.graph.data.FacebookAuthResponse;
	import com.facebook.graph.data.FacebookSession;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	public class FacebookContentMediator extends ModuleMediator  {
		
		[Inject]
		public var view:FacebookContent;
		
		[Inject]
		public var model:SocialModel;
		
		override public function onRegister():void{
			addContextListener(SocialPostEvent.FACEBOOK_LOGIN_RESULT, onFacebookLoginResult);
			addContextListener(SocialPostEvent.FACEBOOK_LOGIN_FAULT, onFacebookLoginFault);
			addContextListener(SocialPostEvent.FACEBOOK_LOGOUT_RESULT, onFacebookLogoutResult);
			
			eventMap.mapListener(view, "socialServiceSelected", onSelectedChange);
			eventMap.mapListener(view.fbSessionState.signInOutButton, MouseEvent.CLICK, onSignInOutButtonClick);
			eventMap.mapListener(view.showBuyNowChk, Event.CHANGE, onShowBuyNowChkChange);
			
			prepareView();
			onShowBuyNowChkChange(null);
			view.selected = true;
			var session:FacebookAuthResponse = Facebook.getAuthResponse();
			if (session != null && session.uid != null){
				login();
			}
		}
		
		private function prepareView():void {
			var socialPost:SocialPostVO = model.socialPost;
			view.socialImg.source = socialPost.imageUrl;
			view.lblName.text = socialPost.title;
			view.lblCaption.text = socialPost.caption;
			view.lblDesc.text = socialPost.description;
		}
		
		private function onSelectedChange(e:Event):void {
			view.socialContent.enabled = view.selected;
		}
		
		private function onSignInOutButtonClick(e:MouseEvent):void{
			if (model.isFBLoggedIn){
				logout();
			} else {
				view.selected = true;
				login();
			}
		}
		
		private function onShowBuyNowChkChange(e:Event):void {
			if (view.showBuyNowChk.selected){
				var action:Object = new Object();
				action.name = "Buy now";
				action.link = model.socialPost.titleUrl;
				model.socialPost.actions = action;
			} else {
				model.socialPost.actions = null;
			}
		}
		
		public function onFacebookLoginResult(e:SocialPostEvent):void {
			updateFacebookStatus();
		}
		
		public function onFacebookLoginFault(e:SocialPostEvent):void {
			updateFacebookStatus();
		}
		
		public function onFacebookLogoutResult(e:SocialPostEvent):void {
			updateFacebookStatus();
		}
		
		private function updateFacebookStatus():void{
			if (model.isFBLoggedIn && model.fbSession){
				view.fbSessionState.currentState = "loggedIn";
				view.fbSessionState.lblUsername.text = model.fbFullname;
				view.fbSessionState.profileImage.source = "http://graph.facebook.com/"+ model.fbSession.uid +"/picture?type=square";
			} else {
				view.fbSessionState.currentState = "notLoggedIn";
			}
		} 
		
		private function login():void{
			// dispatch event to login for selected item
			var socialEvent:SocialPostEvent = new SocialPostEvent(SocialPostEvent.FACEBOOK_LOGIN);
			dispatch(socialEvent);
		}
		
		private function logout():void{
			var socialEvent:SocialPostEvent = new SocialPostEvent(SocialPostEvent.FACEBOOK_LOGOUT);	
			dispatch(socialEvent);
		}
	}
}