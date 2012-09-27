package cc.sitemaker.social.controller.twitter
{
	import cc.sitemaker.common.service.NVPServiceInvoker;
	import cc.sitemaker.common.service.Session;
	import cc.sitemaker.common.service.nvp.NVPEmailService;
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.social.model.SocialModel;
	import cc.sitemaker.util.SMBridge;
	
	import flash.external.ExternalInterface;
	
	import org.robotlegs.mvcs.Command;
	
	public class TwitterLoginCommand extends Command{
		
		[Inject]
		public var model:SocialModel;
		
		override public function execute():void{
			if (model.isTWLoggedIn){
				dispatchResult();
			} else {
				ExternalInterface.addCallback("onTwitterAuth", onTwitterAuth);
				ExternalInterface.call("SM.Twitter.openTwitterAuth", "membership");
			}
		}
		
		private function onTwitterAuth():void{
			var sppe:SocialPostEvent = new SocialPostEvent(SocialPostEvent.TWITTER_VERIFY);
			dispatch(sppe);
		}	
		
		private function dispatchResult():void{
			var sppe:SocialPostEvent = new SocialPostEvent(SocialPostEvent.TWITTER_LOGIN_RESULT);
			dispatch(sppe);
		}
	}
}
