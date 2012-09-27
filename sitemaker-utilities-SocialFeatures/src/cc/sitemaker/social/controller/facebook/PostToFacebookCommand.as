package cc.sitemaker.social.controller.facebook
{
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.social.model.SocialModel;
	import cc.sitemaker.social.model.vo.SocialPostVO;
	
	import com.facebook.graph.Facebook;
	
	import mx.utils.ObjectUtil;
	
	import org.robotlegs.utilities.macro.AsyncCommand;
	
	public class PostToFacebookCommand extends AsyncCommand {
	
		[Inject]
		public var event:SocialPostEvent;
		
		[Inject]
		public var model:SocialModel;
		
		override public function execute():void{
			var socialPost:SocialPostVO = event.socialPost;
			socialPost.message = event.facebookMessage;
			Facebook.api("/me/feed", handleResult, socialPost.toFacebookObject(), "POST");
			
			commandMap.detain(this); 
		}
		
		private function handleResult(result:Object, fault:Object):void {
			if (result != null){
				commandComplete();
			} else {
				trace("PostToSocialCommand::handleResult::fault", ObjectUtil.toString(fault));
				if (fault != null && fault.hasOwnProperty("error")){
					var error:Object = fault.error;
					if (error.type == "OAuthException"){
						model.isFBLoggedIn = false;
						Facebook.logout(null);
					}
				}
				commandIncomplete();
			}
			
			commandMap.release(this); 
		}
		
	}
}