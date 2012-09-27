package cc.sitemaker.puremvc.controller
{
	import cc.sitemaker.puremvc.view.components.WelcomeScreen;
	import cc.sitemaker.puremvc.view.mediator.WelcomeScreenMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ViewPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			trace ("initialize Views and mediator");
			var application:PureMVCDemo = notification.getBody() as PureMVCDemo;
			var welcome: WelcomeScreen = new WelcomeScreen ();
			application.addElement(welcome);
			var welcomeMediator  : WelcomeScreenMediator =  new WelcomeScreenMediator (WelcomeScreenMediator.NAME,welcome);
			facade.registerMediator(welcomeMediator);
				
		}
	}
}