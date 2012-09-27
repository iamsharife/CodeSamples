package cc.sitemaker.mvcmodular.globaltags.controler.startup
{
	
	import modules.ICoreModule;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	public class ModelPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			trace ("proxy setup for Global");
			var icor: ICoreModule  = ICoreModule (notification.getBody());
			
			for each (var proxy : Proxy in icor.sharedProxies){
				facade.registerProxy(proxy);
			}

		}
	}
}