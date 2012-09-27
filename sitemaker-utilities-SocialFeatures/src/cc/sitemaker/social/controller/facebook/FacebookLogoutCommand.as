package cc.sitemaker.social.controller.facebook
{
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.social.model.SocialModel;
	
	import com.facebook.graph.Facebook;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class FacebookLogoutCommand extends ModuleCommand{
		
		[Inject]
		public var event:SocialPostEvent;
		
		[Inject]
		public var model:SocialModel;
		
		override public function execute():void{
			Facebook.logout(handleResult);
		}
		
		private function handleResult(result:Object):void {
			model.isFBLoggedIn = false;
			dispatchResult();
		}
		
		private function dispatchResult():void{
			var sppe:SocialPostEvent = new SocialPostEvent(SocialPostEvent.FACEBOOK_LOGOUT_RESULT);
			dispatch(sppe);
			dispatchToModules(sppe);
		}
	}
}