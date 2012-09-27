package cc.sitemaker.robotlegs.siteServices.controller
{
	import cc.sitemaker.robotlegs.siteServices.view.components.SiteServicesMain;
	
	import modules.SiteServices;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	public class SiteServicesStartupCommand extends Command
	{
		override public function execute():void{
			
			var siteServicesMain: SiteServicesMain = new SiteServicesMain ();
			(contextView as SiteServices).addElement(siteServicesMain);
			
			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
		}
	}
}