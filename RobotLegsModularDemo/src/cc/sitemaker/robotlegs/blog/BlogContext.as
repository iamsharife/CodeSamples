package cc.sitemaker.robotlegs.blog
{
	import cc.sitemaker.robotlegs.blog.controller.BlogStartupCommand;
	import cc.sitemaker.robotlegs.blog.view.components.BlogMain;
	import cc.sitemaker.robotlegs.blog.view.mediator.BlogMainMediator;
	import cc.sitemaker.robotlegs.blog.view.mediator.BlogMainMediator2;
	import cc.sitemaker.robotlegs.shell.controller.AddWelcomeScreenCommand;
	import cc.sitemaker.robotlegs.shell.view.components.MainScreen;
	import cc.sitemaker.robotlegs.shell.view.mediator.MainMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	public class BlogContext extends ModuleContext
	{
		public function BlogContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true, parentInjector:IInjector = null)
		{
			super(contextView, autoStartup, parentInjector);
		}
		
		override public function startup():void{
			
			commandMap.mapEvent(ContextEvent.STARTUP, BlogStartupCommand, ContextEvent, true);
			
			mediatorMap.mapView(BlogMain, BlogMainMediator);	
			
			mediatorMap.mapView(BlogMain, BlogMainMediator2);			
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
	}
}