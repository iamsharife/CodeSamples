package cc.sitemaker.puremvc.controller
{
	import cc.sitemaker.puremvc.model.SiteServicesProxy;
	
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