package cc.sitemaker.social.controller.twitter
{
	import cc.sitemaker.common.service.NVPServiceInvoker;
	import cc.sitemaker.common.service.Session;
	import cc.sitemaker.common.service.nvp.NVPEmailService;
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.util.SMBridge;
	
	import mx.rpc.Fault;
	
	import org.robotlegs.utilities.macro.AsyncCommand;
	
	public class PostToTwitterCommand extends AsyncCommand
	{
		[Inject]
		public var event:SocialPostEvent;
		
		public var error:String;
		
		override public function execute():void{
			var mark:String = SMBridge.getProperty("container.getMark()");
			var username:String = SMBridge.getProperty("container.getUsername()");
			
			var emailService:NVPEmailService = new NVPEmailService();
			emailService.rootURL = SMBridge.getProperty('container.getCGIPath()');
			emailService.session = new Session(mark, username);
			
			var request:Object = new Object();
			request["body"] = event.twitterMessage + ": " + event.socialPost.titleUrl;
			
			var invoker:NVPServiceInvoker = new NVPServiceInvoker(emailService);
			invoker.sendRequest("twitter_post", resultHandler, faultHandler, request);
			
			commandMap.detain(this); 
		}
		
		protected function resultHandler(e:Object):void{
			commandComplete();
			commandMap.release(this); 
		}
		
		protected function faultHandler(e:Object):void{
			error = ((e as Fault).faultCode == "16") ? (e as Fault).faultString : "An error has occured. Please try again.";
			commandIncomplete();
			commandMap.release(this); 
		}
	}
}