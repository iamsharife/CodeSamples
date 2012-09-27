package cc.sitemaker.puremvc.shell.controller.state
{
	import cc.sitemaker.puremvc.shell.StateVersion;
	import cc.sitemaker.puremvc.shell.model.SiteServicesProxy;
	import cc.sitemaker.puremvc.shell.view.components.MainScreen;
	import cc.sitemaker.puremvc.shell.view.mediator.DemoMediator;
	import cc.sitemaker.puremvc.shell.view.mediator.MainScreenMediator;
	
	import org.puremvc.as3.multicore.core.View;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import org.puremvc.as3.multicore.utilities.statemachine.State;
	
	public class EnteringMain extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			
			var currentFMSState  :State = State (notification.getBody());
			if (currentFMSState.name != StateVersion.BUY){
				var demoMediator :DemoMediator =DemoMediator ( facade.retrieveMediator(DemoMediator.NAME));
				var mainScreenMediator  : MainScreenMediator ;
				
				if (!facade.hasMediator(MainScreenMediator.NAME)){
					var welcome: MainScreen = new MainScreen ();
					demoMediator.view.addElement(welcome);
					mainScreenMediator =  new MainScreenMediator (MainScreenMediator.NAME,welcome,notification.getBody().name);
					facade.registerMediator(mainScreenMediator);
				}else {
					mainScreenMediator =  MainScreenMediator (facade.retrieveMediator(MainScreenMediator.NAME));
					mainScreenMediator.view.currentState = notification.getBody().name;
				}
					
					}
			
			
		}
	}
}