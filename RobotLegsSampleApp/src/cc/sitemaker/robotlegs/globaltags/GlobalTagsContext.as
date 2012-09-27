package cc.sitemaker.robotlegs.globaltags
{
	import cc.sitemaker.robotlegs.globaltags.controller.SiteServicesStartupCommand;
	import cc.sitemaker.robotlegs.globaltags.view.components.GlobalTagsMainView;
	import cc.sitemaker.robotlegs.globaltags.view.mediator.GlobalTagsMainMediator;
	
	import flash.display.DisplayObjectContainer;
	import flash.system.ApplicationDomain;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	public class GlobalTagsContext extends ModuleContext
	{
		public function GlobalTagsContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true, parentInjector:IInjector = null)
		{
			super(contextView, autoStartup, parentInjector);
		}
		
		override public function startup():void{
			
			commandMap.mapEvent(ContextEvent.STARTUP, SiteServicesStartupCommand, ContextEvent, true);
			
			mediatorMap.mapView(GlobalTagsMainView, GlobalTagsMainMediator);			
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
		
		override public function dispose():void
		{
			mediatorMap.removeMediatorByView(contextView);
			super.dispose();
		}
	}
}