package cc.sitemaker.mvcmodular.globaltags.view
{
	import cc.sitemaker.mvcmodular.shell.model.GlobalTagsProxy;
	import cc.sitemaker.mvcmodular.shell.model.vo.TagVo;
	
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class GlobalTagMediator extends Mediator
	{	
		public static const NAME : String =  "global Tag Mediator"
		public function GlobalTagMediator( viewComponent:UIComponent=null)
		{
			super(NAME, viewComponent);
		}
		
		public function get view ():GlobalTagsMainView
		{
			return viewComponent as GlobalTagsMainView
		}
		
		override public function onRegister():void
		{
			var globalTagProxy : GlobalTagsProxy = GlobalTagsProxy( facade.retrieveProxy(GlobalTagsProxy.NAME));
			view.btnAddToPost.addEventListener(MouseEvent.CLICK, addTag);
			view.dataFromProxy = globalTagProxy.tags;
			view.initBinding();
		}
		
		override public function onRemove():void{
			view.removeBinding();
			view.btnAddToPost.removeEventListener(MouseEvent.CLICK, addTag);
		}
		
		private function addTag(event:MouseEvent):void
		{
			var globalTagProxy : GlobalTagsProxy = GlobalTagsProxy( facade.retrieveProxy(GlobalTagsProxy.NAME));
			var tag:TagVo = new TagVo();
			tag.name = view.txtNewTag.text;
			globalTagProxy.addTag(tag);
		}
	}
}