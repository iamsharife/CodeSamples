package cc.sitemaker.puremvc.shell.controller.state
{
	import cc.sitemaker.puremvc.shell.view.components.BuyFeatures;
	import cc.sitemaker.puremvc.shell.view.components.MainScreen;
	import cc.sitemaker.puremvc.shell.view.mediator.BuyFeaturesMediator;
	import cc.sitemaker.puremvc.shell.view.mediator.DemoMediator;
	import cc.sitemaker.puremvc.shell.view.mediator.MainScreenMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class EnteringBuy extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			trace ("buy" )
			// Remove the welcome view, please note the typical pmvc boiler plate
			var welcomeMediator : MainScreenMediator = MainScreenMediator ( facade.retrieveMediator(MainScreenMediator.NAME));
			var mainMediator : DemoMediator = DemoMediator ( facade.retrieveMediator(DemoMediator.NAME));
			mainMediator.view.removeElement(welcomeMediator.view);
			facade.removeMediator(MainScreenMediator.NAME);
			
			// display the buy view 
			var buy :BuyFeatures = new BuyFeatures ();
			mainMediator.view.addElement(buy);
			var buyMediator : BuyFeaturesMediator =  new BuyFeaturesMediator (buy);
			facade.registerMediator(buyMediator); 
			
			
						
			
		}
	}
}