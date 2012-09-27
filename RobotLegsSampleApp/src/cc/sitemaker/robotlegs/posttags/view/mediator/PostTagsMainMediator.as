package cc.sitemaker.robotlegs.posttags.view.mediator
{
	import cc.sitemaker.robotlegs.common.events.ModelEvent;
	import cc.sitemaker.robotlegs.common.model.PostTagsModel;
	import cc.sitemaker.robotlegs.common.model.TagsModel;
	import cc.sitemaker.robotlegs.common.model.vo.TagVo;
	import cc.sitemaker.robotlegs.posttags.view.components.PostTagsMainView;
	
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import modules.PostTags;
	
	import mx.binding.utils.BindingUtils;
	
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	public class PostTagsMainMediator extends ModuleMediator
	{
		[Inject]
		public var postTagsView:PostTagsMainView;
		
		[Inject]
		public var globalTagsModel:TagsModel;
		[Inject]
		public var postTagsModel:PostTagsModel;
		
		[Inject]
		public var dispatcher:IModuleEventDispatcher;
		
		public function PostTagsMainMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			dispatcher.addEventListener(ModelEvent.MODEL_PROPERTY_CHANGE, onModelChangeEvent);		
					
			postTagsView.btnAddToPost.addEventListener(MouseEvent.CLICK, onAddToPostClick);
			postTagsView.globalTags = globalTagsModel.tags;
			postTagsView.postTags = postTagsModel.tagsForPost;
			
			postTagsView.initBinding();
		}
		
		private function onModelChangeEvent(e:ModelEvent):void
		{
			trace("onModelChangeEvent:", e.toString(), e.model);	
			if (e.model is TagsModel){
				postTagsView.globalTags = globalTagsModel.tags;
			}
		}
		
		override public function onRemove():void{
			dispatcher.removeEventListener(ModelEvent.MODEL_PROPERTY_CHANGE, onModelChangeEvent);			
			
			postTagsView.removeBinding();
		}
		
		private function onAddToPostClick(event:MouseEvent):void
		{
			postTagsModel.addTag(TagVo(postTagsView.lstGlobalTags.selectedItem));
		}
	}
}