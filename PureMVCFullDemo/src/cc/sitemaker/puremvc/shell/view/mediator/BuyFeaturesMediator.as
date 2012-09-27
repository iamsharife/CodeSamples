package cc.sitemaker.puremvc.shell.view.mediator
{
	import cc.sitemaker.puremvc.shell.ApplicationNotification;
	import cc.sitemaker.puremvc.shell.model.SiteServicesProxy;
	import cc.sitemaker.puremvc.shell.view.components.BuyFeatures;
	
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	import org.puremvc.as3.multicore.utilities.statemachine.StateMachine;
	
	public class BuyFeaturesMediator extends Mediator
	{	
		public static const NAME:String = "buyMediator"
		public function BuyFeaturesMediator(viewComponent:BuyFeatures=null)
		{
			super(NAME, viewComponent);
		}
		public function get view():BuyFeatures {
			return viewComponent as BuyFeatures;
		}
		public override function onRegister():void {
			view.buyNow.addEventListener(MouseEvent.CLICK, onBuy);
			view.back.addEventListener(MouseEvent.CLICK, onBack);
		}
		
		public override function onRemove():void{
			view.buyNow.removeEventListener(MouseEvent.CLICK, onBuy);
			view.back.removeEventListener(MouseEvent.CLICK, onBack);
		}
		
		
		private function onBuy (e:MouseEvent) : void {
			var proxy : SiteServicesProxy =  SiteServicesProxy (facade.retrieveProxy(SiteServicesProxy.NAME));
			proxy.fullLicence = true;
			
		}
		private function onBack (e:MouseEvent) : void {
			var proxy : SiteServicesProxy =  SiteServicesProxy (facade.retrieveProxy(SiteServicesProxy.NAME));
			
			if (proxy.fullLicence){
				sendNotification(StateMachine.ACTION,null,ApplicationNotification.FULL_VERSION);
			}else{
				sendNotification(StateMachine.ACTION,null,ApplicationNotification.TRIAL);
			}
		}
	}
}