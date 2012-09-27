package cc.sitemaker.social.controller.twitter
{
	import cc.sitemaker.common.service.NVPServiceInvoker;
	import cc.sitemaker.common.service.Session;
	import cc.sitemaker.common.service.nvp.NVPEmailService;
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.social.model.SocialModel;
	import cc.sitemaker.util.SMBridge;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class TwitterLogoutCommand extends ModuleCommand {
		
		[Inject]
		public var model:SocialModel;
		
		override public function execute():void{
			var mark:String = SMBridge.getProperty("container.getMark()");
			var username:String = SMBridge.getProperty("container.getUsername()");
			
			var emailService:NVPEmailService = new NVPEmailService();
			emailService.rootURL = SMBridge.getProperty('container.getCGIPath()');
			emailService.session = new Session(mark, username);
			
			var invoker:NVPServiceInvoker = new NVPServiceInvoker(emailService);
			invoker.sendRequest("twitter_logout", resultHandler, faultHandler, {});
		}
		
		protected function resultHandler(e:Object):void{
			model.isTWLoggedIn = false;
			model.twScreenName = "";
			dispatchResult();
		}
		
		private function dispatchResult():void{
			var sppe:SocialPostEvent = new SocialPostEvent(SocialPostEvent.TWITTER_LOGOUT_RESULT);
			dispatch(sppe);
		}
		
		protected function faultHandler(e:Object):void{
			model.isTWLoggedIn = false;
			
			var sppe:SocialPostEvent = new SocialPostEvent(SocialPostEvent.TWITTER_LOGOUT_FAULT);
			sppe.error = e.faultCode;
			dispatch(sppe);
		}
	}
}
