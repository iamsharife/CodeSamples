package cc.sitemaker.social.controller.facebook
{
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.social.model.SocialModel;
	
	import com.facebook.graph.Facebook;
	import com.facebook.graph.data.FacebookSession;
	
	import mx.utils.ObjectUtil;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class FacebookLoginCommand extends ModuleCommand {
		
		[Inject]
		public var event:SocialPostEvent;
		
		[Inject]
		public var model:SocialModel;
		
		override public function execute():void{
			if (model.isFBLoggedIn && hasNewPermissions() == false){
				handleResult(Facebook.getAuthResponse(), null);
				return;
			}
			trace("FacebookLoginCommand::Facebook.login");
			//Facebook.login(handleResult, {perms:event.permissions});
			Facebook.login(handleResult, {scope:"create_note, publish_stream, manage_pages"});
		}
		
		private function hasNewPermissions():Boolean {
			// need to add logic to check if the new set of permissions 
			
			return false;
		}
		
		public function handleResult(session:Object, fail:Object):void {
			trace("FacebookLoginCommand::handleResult");
			if (session != null && session.uid != null) {
				model.isFBLoggedIn = true;
				model.fbSession = Facebook.getAuthResponse();
				Facebook.api("/me", handleGetMe);
			} else {
				model.isFBLoggedIn = false;
				model.fbSession = null;
			}
		}
		 
		public function handleGetMe(result:Object, fail:Object):void{
			trace("FacebookLoginCommand::handleGetMe::result", ObjectUtil.toString(result));
			trace("FacebookLoginCommand::handleGetMe::fault", ObjectUtil.toString(fail));
			if (result != null){
				model.fbFullname = result.name;
				dispatchResult();
			} else {
				dispatchFault("error");
			}
		}
		
		private function dispatchResult():void{
			var sppe:SocialPostEvent = new SocialPostEvent(SocialPostEvent.FACEBOOK_LOGIN_RESULT);
			dispatch(sppe);
			dispatchToModules(sppe.clone());
		}
		
		private function dispatchFault(error:String):void{
			var sppe:SocialPostEvent = new SocialPostEvent(SocialPostEvent.FACEBOOK_LOGIN_FAULT);
			sppe.error = error;
			dispatch(sppe);
			dispatchToModules(sppe.clone());
		}
	}
}