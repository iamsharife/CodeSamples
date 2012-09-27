package cc.sitemaker.puremvc.shell.controller.startup
{
	import cc.sitemaker.puremvc.shell.view.components.MainScreen;
	import cc.sitemaker.puremvc.shell.view.mediator.DemoMediator;
	import cc.sitemaker.puremvc.shell.view.mediator.MainScreenMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ViewPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			trace ("initialize Views and mediator");
			var application:PureMVCFullDemo = notification.getBody() as PureMVCFullDemo;
			
			//register the main Application  
			var demoMediator :DemoMediator =  new DemoMediator (application);
			facade.registerMediator(demoMediator);
				
		}
	}
}