package cc.sitemaker.social.controller.facebook {
	
	import cc.sitemaker.common.service.NVPServiceInvoker;
	import cc.sitemaker.common.service.Session;
	import cc.sitemaker.common.service.nvp.NVPSettingsService;
	import cc.sitemaker.social.model.SocialModel;
	import cc.sitemaker.util.SMBridge;
	
	import com.facebook.graph.Facebook;
	import com.facebook.graph.data.FacebookAuthResponse;
	
	import mx.utils.ObjectUtil;
	
	import org.robotlegs.mvcs.Command;
	
	public class GetFacebookAppIDCommand extends Command {
		
		[Inject]
		public var model:SocialModel;
		
		private var _fbAppId:String;
		
		override public function execute():void{
			var mark:String = SMBridge.getProperty("container.getMark()");
			var username:String = SMBridge.getProperty("container.getUsername()");
			
			var request:Object = new Object();
			
			var settingsService:NVPSettingsService = new NVPSettingsService();
			settingsService.rootURL = SMBridge.getProperty('container.getCGIPath()');
			settingsService.session = new Session(mark, username);
			
			var invoker:NVPServiceInvoker = new NVPServiceInvoker(settingsService);
			invoker.sendRequest("getFacebookAppID", resultHandler, null, request);
		}
		
		protected function resultHandler(e:Object):void{
			if (e.hasOwnProperty("app_id")){
				_fbAppId = e.app_id;
				Facebook.init(e.app_id, onInitResult, {status: true});
			}
		}
		
		private function onInitResult(success:Object, fail:Object):void{
			trace("GetFacebookAppIDCommand::onInitResult", ObjectUtil.toString(success));
			var session:FacebookAuthResponse = Facebook.getAuthResponse();
			if (success != null && session.uid != null){
				model.fbAppID = _fbAppId;
				model.isFBLoggedIn = true;
				model.fbSession = Facebook.getAuthResponse();
			} else {
				model.isFBLoggedIn = false;
				model.fbSession = null;
			}
		}
	}
}
