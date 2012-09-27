package cc.sitemaker.social.controller
{
	import cc.sitemaker.social.controller.facebook.PostToFacebookCommand;
	import cc.sitemaker.social.controller.twitter.PostToTwitterCommand;
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.social.model.SocialModel;
	
	import org.robotlegs.utilities.macro.SubcommandDescriptor;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	import org.robotlegs.utilities.modular.mvcs.commands.ParallelModuleCommand;
	
	public class PostToSocialCommand extends ParallelModuleCommand{
		
		[Inject]
		public var event:SocialPostEvent;
		
		[Inject]
		public var model:SocialModel;
		
		private var _fbSuccess:Boolean;
		private var _twSuccess:Boolean;
		private var _twError:String;
		
		override public function execute():void{
			_fbSuccess = false;
			_twSuccess = false;
			
			isAtomic = false;
			
			
			var allLoggedIn:Boolean = true;
			var error:String = "Error has occurred";
			
			if (event.toFacebook && event.toTwitter){
				if (!model.isFBLoggedIn && !model.isTWLoggedIn){
					allLoggedIn = false;
					error = "Please sign into <a href=\""+ SocialPostEvent.FACEBOOK_LOGIN +"\">Facebook</a> and <a href=\""+ SocialPostEvent.TWITTER_LOGIN +"\">Twitter</a>.";
				} else if(!model.isFBLoggedIn && model.isTWLoggedIn) {
					allLoggedIn = false;
					error = "Please sign into <a href=\""+ SocialPostEvent.FACEBOOK_LOGIN +"\">Facebook</a>.";
				} else if(model.isFBLoggedIn && !model.isTWLoggedIn) {
					allLoggedIn = false;
					error = "Please sign into <a href=\""+ SocialPostEvent.TWITTER_LOGIN +"\">Twitter</a>.";
				}
			} else if (event.toFacebook) {
				allLoggedIn = model.isFBLoggedIn;
				error = (allLoggedIn) ? "" : "Please sign into <a href=\""+ SocialPostEvent.FACEBOOK_LOGIN +"\">Facebook</a>.";
			} else if (event.toTwitter) {
				allLoggedIn = model.isTWLoggedIn;
				error = (allLoggedIn) ? "" : "Please sign into <a href=\""+ SocialPostEvent.TWITTER_LOGIN +"\">Twitter</a>.";
			}
			
			if (allLoggedIn == false){
				dispatchFault(error);
				commandMap.release(this);
				return;
			}
			
			if (event.toFacebook){
				addCommand(PostToFacebookCommand, event);
			}
			if (event.toTwitter){
				addCommand(PostToTwitterCommand, event);
			}
			
			super.execute();
		}
		
		override protected function subcommandComplete(cmd:SubcommandDescriptor):void{
			
			switch(cmd.commandClass){
				case PostToFacebookCommand:
					_fbSuccess = true;
					break;
				case PostToTwitterCommand:
					_twSuccess = true;
					
					break;
			}
			super.subcommandComplete(cmd);
		}
		
		override protected function subcommandIncomplete(cmd:SubcommandDescriptor):void{
			
			switch(cmd.commandClass){
				case PostToFacebookCommand:
					break;
				case PostToTwitterCommand:
					_twError = (cmd.commandInstance as PostToTwitterCommand).error;					
					break;
			}
			super.subcommandIncomplete(cmd);
		}
		
		override protected function commandComplete():void{
			super.commandComplete();
			
			dispatchResult();
		}
		
		override protected function commandIncomplete():void{
			super.commandIncomplete();
			
			var error:String = "Error has occurred";
			if (event.toFacebook && !_fbSuccess){
				error = "You have been signed out of Facebook, please try signing in again.";
				dispatch(new SocialPostEvent(SocialPostEvent.FACEBOOK_LOGOUT));
			} else if (event.toTwitter && !_twSuccess){
				error = _twError;
			}
			dispatchFault(error);
		}
		
		private function dispatchResult():void {
			var sppe:SocialPostEvent = new SocialPostEvent(SocialPostEvent.POST_TO_SOCIAL_RESULT);
			dispatch(sppe);
			dispatchToModules(sppe);
		}
		
		private function dispatchFault(error:String):void {
			var sppe:SocialPostEvent = new SocialPostEvent(SocialPostEvent.POST_TO_SOCIAL_FAULT);
			sppe.toFacebook = event.toFacebook;
			sppe.toFacebookSuccessful = _fbSuccess;
			sppe.toTwitter = event.toTwitter;
			sppe.toTwitterSuccessful = _twSuccess;
			sppe.error = error;
			dispatch(sppe);
			dispatchToModules(sppe);
		}
	}
}