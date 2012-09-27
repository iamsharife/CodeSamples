package cc.sitemaker.puremvc.shell.controller.startup
{
	import cc.sitemaker.puremvc.shell.model.SiteServicesProxy;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ModelPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			trace ("initialize model : Proxy");
			var beProxy : SiteServicesProxy =  new SiteServicesProxy (SiteServicesProxy.NAME);
			facade.registerProxy(beProxy);
		}
	}
}