package cc.sitemaker.mvcmodular.globaltags.controler.startup
{

	
	import cc.sitemaker.mvcmodular.globaltags.view.GlobalTagMediator;
	
	import modules.GlobalTags;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ViewPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			var app : GlobalTags = GlobalTags (notification.getBody()); 
			var globalTagMediator  : GlobalTagMediator =new GlobalTagMediator(app.main); 
			facade.registerMediator(globalTagMediator);
				
		}
	}
}