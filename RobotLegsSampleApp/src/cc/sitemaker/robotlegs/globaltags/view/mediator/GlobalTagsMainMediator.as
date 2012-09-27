package cc.sitemaker.robotlegs.globaltags.view.mediator
{
	import cc.sitemaker.robotlegs.common.events.ModelEvent;
	import cc.sitemaker.robotlegs.common.model.TagsModel;
	import cc.sitemaker.robotlegs.common.model.vo.TagVo;
	import cc.sitemaker.robotlegs.globaltags.view.components.GlobalTagsMainView;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;

	public class GlobalTagsMainMediator extends ModuleMediator
	{
		[Inject]public var globalTagsView:GlobalTagsMainView;
		
		[Inject]public var model:TagsModel;
		
		[Inject]public var dispatcher:IModuleEventDispatcher;
		
		public function GlobalTagsMainMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			dispatcher.addEventListener(ModelEvent.MODEL_PROPERTY_CHANGE, onModelChangeEvent);
			
			globalTagsView.btnAddToPost.addEventListener(MouseEvent.CLICK, onAddPostClick);
			globalTagsView.globalTags = model.tags;
		}
		
		private function onModelChangeEvent(e:ModelEvent):void
		{
			trace("onModelChangeEvent:", e.toString(), e.model);	
			if (e.model is TagsModel){
				globalTagsView.globalTags = model.tags;
			}
		}
		
		override public function onRemove():void{
			dispatcher.removeEventListener(ModelEvent.MODEL_PROPERTY_CHANGE, onModelChangeEvent);			
		}

		private function onAddPostClick(event:MouseEvent):void
		{
			var tag:TagVo = new TagVo();
			tag.name = globalTagsView.txtNewTag.text;
			model.addTag(tag);
		}
	}
}