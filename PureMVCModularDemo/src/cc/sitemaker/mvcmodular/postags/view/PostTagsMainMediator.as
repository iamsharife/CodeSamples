package cc.sitemaker.mvcmodular.postags.view
{
	import cc.sitemaker.mvcmodular.shell.model.GlobalTagsProxy;
	import cc.sitemaker.mvcmodular.shell.model.PostTagsProxy;
	import cc.sitemaker.mvcmodular.shell.model.vo.TagVo;
	
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class PostTagsMainMediator extends Mediator
	{	
		public static const NAME : String =  "PostTagMediator"
		public function PostTagsMainMediator(viewComponent:UIComponent=null)
		{
			super(NAME, viewComponent);
		}
		
		public function get view ():PostTagsMainView
		{
			return viewComponent as PostTagsMainView
		}
		
		override public function onRegister():void
		{
			var globalTagProxy : GlobalTagsProxy = GlobalTagsProxy( facade.retrieveProxy(GlobalTagsProxy.NAME));
			var postTagsProxy : PostTagsProxy = PostTagsProxy( facade.retrieveProxy(PostTagsProxy.NAME));
		
			view.btnAddToPost.addEventListener(MouseEvent.CLICK, onAddToPostClick);
			view.globalTags = globalTagProxy.tags;
			view.postTags = postTagsProxy.tagsForPost;
			view.initBinding();
			
		}
		
		override public function onRemove():void
		{
		
			view.removeBinding();
			view.btnAddToPost.removeEventListener(MouseEvent.CLICK, onAddToPostClick);
		}
		
		
		private function onAddToPostClick(event:MouseEvent):void
		{
			var globalTagProxy : GlobalTagsProxy = GlobalTagsProxy( facade.retrieveProxy(GlobalTagsProxy.NAME));
			var postTagsProxy : PostTagsProxy = PostTagsProxy( facade.retrieveProxy(PostTagsProxy.NAME));
			postTagsProxy.addTag(TagVo(view.lstGlobalTags.selectedItem));
		}
		
		
	}
}