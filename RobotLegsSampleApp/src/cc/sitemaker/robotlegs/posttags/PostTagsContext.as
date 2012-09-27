package cc.sitemaker.robotlegs.posttags
{
	import cc.sitemaker.robotlegs.posttags.controller.BlogStartupCommand;
	import cc.sitemaker.robotlegs.posttags.view.components.PostTagsMainView;
	import cc.sitemaker.robotlegs.posttags.view.mediator.PostTagsMainMediator;
	import cc.sitemaker.robotlegs.shell.controller.AddWelcomeScreenCommand;
	import cc.sitemaker.robotlegs.shell.view.components.MainScreen;
	import cc.sitemaker.robotlegs.shell.view.mediator.MainMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	public class PostTagsContext extends ModuleContext
	{
		public function PostTagsContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true, parentInjector:IInjector = null)
		{
			super(contextView, autoStartup, parentInjector);
		}
		
		override public function startup():void{
			
			commandMap.mapEvent(ContextEvent.STARTUP, BlogStartupCommand, ContextEvent, true);
			
			mediatorMap.mapView(PostTagsMainView, PostTagsMainMediator);	
			
			//mediatorMap.mapView(BlogMain, BlogMainMediator2);			
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
	}
}