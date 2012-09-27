package cc.sitemaker.social.view.mediators {
	
	import cc.sitemaker.social.event.HTMLLabelEvent;
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.social.model.SocialModel;
	import cc.sitemaker.social.view.components.SocialPostPanel;
	import cc.sitemaker.social.view.components.skin.SocialButtonBarButtonSkin;
	
	import flash.events.MouseEvent;
	
	import mx.events.CloseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class SocialPostPanelMediator extends Mediator {
		
		[Inject]
		public var view:SocialPostPanel;
		
		[Inject]
		public var model:SocialModel;
		
		override public function onRegister():void{
			addContextListener(SocialPostEvent.POST_TO_SOCIAL_RESULT, onPostToSocialResult);
			addContextListener(SocialPostEvent.POST_TO_SOCIAL_FAULT, onPostToSocialFault);
			addContextListener(SocialPostEvent.FACEBOOK_LOGIN_RESULT, onLoginResult);
			addContextListener(SocialPostEvent.TWITTER_LOGIN_RESULT, onLoginResult);
			
			eventMap.mapListener(view.shareBtn, MouseEvent.CLICK, onSendButtonClick);
			eventMap.mapListener(view.errorField, HTMLLabelEvent.LINK_CLICKED, onLinkClicked);
			
			mediatorMap.createMediator(view.fbContent);
			mediatorMap.createMediator(view.twContent);
		}
		
		private function onSendButtonClick(e:MouseEvent):void {
			view.errorContainer.visible = false;
			view.errorField.text = "";
			var socialEvent:SocialPostEvent = new SocialPostEvent(SocialPostEvent.POST_TO_SOCIAL);
			socialEvent.toFacebook = view.fbContent.selected;
			socialEvent.facebookMessage = view.fbContent.messageArea.text;
			socialEvent.toTwitter = view.twContent.selected;
			socialEvent.twitterMessage = view.twContent.messageArea.text;
			socialEvent.socialPost = model.socialPost;
			dispatch(socialEvent);
		}
		
		private function onPostToSocialResult(e:SocialPostEvent):void{
			view.dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
		}
		
		public function onPostToSocialFault(e:SocialPostEvent):void{
			view.errorContainer.visible = true;
			view.errorField.text = e.error;
		}
		
		private function onLoginResult(e:SocialPostEvent):void{
			view.errorContainer.visible = false;
			view.errorField.text = "";
		}
		
		private function onLinkClicked(e:HTMLLabelEvent):void{
			var spe:SocialPostEvent = new SocialPostEvent(e.eventRequested);
			dispatch(spe);
		}
	}
}
