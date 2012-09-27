package cc.sitemaker.social.controller
{
	import cc.sitemaker.social.event.SocialPostEvent;
	import cc.sitemaker.social.model.SocialModel;
	import cc.sitemaker.social.view.components.SocialPostPanel;
	
	import mx.core.IFlexDisplayObject;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Command;
	
	public class InvokeSocialPostPanelCommand extends Command {
		
		[Inject]
		public var event:SocialPostEvent;
		
		[Inject]
		public var model:SocialModel;
		
		override public function execute():void{
			model.socialPost = event.socialPost;
			
			var spp:SocialPostPanel = new SocialPostPanel();
			spp.addEventListener(CloseEvent.CLOSE, onClose);
			
			PopUpManager.addPopUp(spp, contextView, true);
			PopUpManager.centerPopUp(spp);
			
			mediatorMap.createMediator(spp);	
		}
		
		private  function onClose(e:CloseEvent):void{
			PopUpManager.removePopUp(e.target as IFlexDisplayObject); 
			mediatorMap.removeMediatorByView(e.target); 
		}
	}
}