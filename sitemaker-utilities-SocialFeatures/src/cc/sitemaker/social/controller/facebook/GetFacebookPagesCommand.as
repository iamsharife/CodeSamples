package cc.sitemaker.social.controller.facebook
{
	import cc.sitemaker.social.event.FacebookAPIEvent;
	import cc.sitemaker.social.model.SocialModel;
	import cc.sitemaker.social.model.vo.FacebookPageVO;
	
	import com.facebook.graph.Facebook;
	
	import mx.utils.ObjectUtil;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	import org.robotlegs.utilities.modular.mvcs.commands.ParallelModuleCommand;
	
	public class GetFacebookPagesCommand extends ParallelModuleCommand {
		
		[Inject]
		public var model:SocialModel;
		
		override public function execute():void{
			Facebook.api("/me/accounts", handleResult);
			
			commandMap.detain(this);
			super.execute();
		}
		
		private function handleResult(result:Object, fail:Object):void {
			trace("GetFacebookPagesCommand::handleResult", ObjectUtil.toString(result));
			if (result != null){
				var res:Array = result as Array;
				var pages:Array = new Array();
				for (var i:int = 0; i < res.length; i++) {
					if (res[i].hasOwnProperty("category") && res[i].category != "Application"){
						pages.push(new FacebookPageVO(res[i].id, res[i].name, res[i].category, res[i].access_token));
					}
				}
				
				model.fbPages = pages;
				
				var fae:FacebookAPIEvent = new FacebookAPIEvent(FacebookAPIEvent.GET_PAGES_RESULT);
				dispatch(fae);
				dispatchToModules(fae);
			}
			commandComplete();
			commandMap.release(this);
		}
		
	}
}