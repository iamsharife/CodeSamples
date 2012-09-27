package cc.sitemaker.puremvc.shell.controller.state
{
	import cc.sitemaker.puremvc.shell.view.components.BuyFeatures;
	import cc.sitemaker.puremvc.shell.view.components.MainScreen;
	import cc.sitemaker.puremvc.shell.view.mediator.BuyFeaturesMediator;
	import cc.sitemaker.puremvc.shell.view.mediator.DemoMediator;
	import cc.sitemaker.puremvc.shell.view.mediator.MainScreenMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ExitingBuy extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			trace ("buy Done" )
			var mainMediator : DemoMediator = DemoMediator ( facade.retrieveMediator(DemoMediator.NAME));
			var buyMediator  : BuyFeaturesMediator = BuyFeaturesMediator (facade.retrieveMediator(BuyFeaturesMediator.NAME));
			facade.removeMediator(MainScreenMediator.NAME);
			mainMediator.view.removeElement(buyMediator.view);
			facade.removeMediator(BuyFeaturesMediator.NAME); 
			
			
						
			
		}
	}
}