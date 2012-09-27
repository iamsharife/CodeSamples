package cc.sitemaker.robotlegs.siteServices
{
	import cc.sitemaker.robotlegs.siteServices.controller.SiteServicesStartupCommand;
	import cc.sitemaker.robotlegs.siteServices.view.components.SiteServicesMain;
	import cc.sitemaker.robotlegs.siteServices.view.mediator.SiteServicesMainMediator;
	
	import flash.display.DisplayObjectContainer;
	import flash.system.ApplicationDomain;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IInjector;
	import org.robotlegs.utilities.modular.mvcs.ModuleContext;
	
	public class SiteServicesContext extends ModuleContext
	{
		public function SiteServicesContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true, parentInjector:IInjector = null)
		{
			super(contextView, autoStartup, parentInjector);
		}
		
		override public function startup():void{
			
			commandMap.mapEvent(ContextEvent.STARTUP, SiteServicesStartupCommand, ContextEvent, true);
			
			mediatorMap.mapView(SiteServicesMain, SiteServicesMainMediator);			
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}