package cc.sitemaker.social.controller.facebook
{
	import cc.sitemaker.social.event.FacebookViewEvent;
	import cc.sitemaker.social.model.SocialModel;
	import cc.sitemaker.social.view.components.FacebookPageSelect;
	
	import mx.core.IFlexDisplayObject;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.utilities.macro.SequenceCommand;
	import org.robotlegs.utilities.modular.mvcs.ModuleCommand;
	
	public class OpenPageSelectPanelCommand extends SequenceCommand {
		
		[Inject]
		public var event:FacebookViewEvent;
		
		override public function execute():void{
			
			addCommand(GetFacebookPagesCommand);
			
			super.execute();
		}
		
		override protected function commandComplete():void{
			openPanel();
			super.commandComplete();
		}
		
		private function openPanel():void {
			var fps:FacebookPageSelect = new FacebookPageSelect();
			fps.currentPageId = event.pageId;
			fps.addEventListener(CloseEvent.CLOSE, onClose);
			
			PopUpManager.addPopUp(fps, contextView, true);
			PopUpManager.centerPopUp(fps);
			
			mediatorMap.createMediator(fps);	
		}
		
		private  function onClose(e:CloseEvent):void{
			PopUpManager.removePopUp(e.target as IFlexDisplayObject); 
			mediatorMap.removeMediatorByView(e.target); 
		}
		
	}
}