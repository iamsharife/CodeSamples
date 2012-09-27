package cc.sitemaker.mvcmodular.shell.controler.startup
{
	import cc.sitemaker.mvcmodular.shell.view.MainMediator;
	import cc.sitemaker.mvcmodular.shell.view.MainScreen;
	import cc.sitemaker.mvcmodular.shell.view.ModularDemoMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ViewPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			trace ("initialize Views and mediator");
			var application:PureMVCModularDemo = notification.getBody() as PureMVCModularDemo;
			
			//register the main Application  
			var demoMediator :ModularDemoMediator =  new ModularDemoMediator (application);
			facade.registerMediator(demoMediator);
			// register main view 
			var main : MainScreen = new MainScreen ();
			application.addElement(main);
			var mainMediator  : MainMediator =  new MainMediator(main); 
			facade.registerMediator(mainMediator);
			
			var med :  MainMediator  =MainMediator ( facade.retrieveMediator(MainMediator.NAME))
				
		}
	}
}