package cc.sitemaker.puremvc.shell.view.mediator
{
	import cc.sitemaker.puremvc.shell.ApplicationNotification;
	import cc.sitemaker.puremvc.shell.StateVersion;
	import cc.sitemaker.puremvc.shell.model.SiteServicesProxy;
	import cc.sitemaker.puremvc.shell.view.components.MainScreen;
	
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	import org.puremvc.as3.multicore.utilities.statemachine.StateMachine;
	
	public class MainScreenMediator extends Mediator
	{	
		public static const NAME:String = "welcomeMediator";
		private var targetState  :String
		
		public function MainScreenMediator(mediatorName:String=null, viewComponent:Object=null, target:String=null)
		{
			super(mediatorName, viewComponent);
			targetState =  target
		}
		
		public override function onRegister():void{
			trace (NAME+' has been register');
			view.fireCommand.addEventListener(MouseEvent.CLICK, onFireCommand);
			view.buyFeature.addEventListener(MouseEvent.CLICK, onBuyRequest);
			view.expireTime.addEventListener(MouseEvent.CLICK, onExpireTime);
			
			view.currentState = (targetState)?targetState:'';
		}
		public override function onRemove():void{
			view.fireCommand.removeEventListener(MouseEvent.CLICK, onFireCommand);
			view.buyFeature.removeEventListener(MouseEvent.CLICK, onBuyRequest);
		}
		
		private function onBuyRequest (e:MouseEvent) : void{
			sendNotification(StateMachine.ACTION,null,ApplicationNotification.BUY);
		}
		private function onFireCommand  (e:MouseEvent ) :void{
			sendNotification (ApplicationNotification.FIRE_COMMAND,{value:'test String'});
		}
		
		private function onExpireTime (e:MouseEvent):void{
			var proxy : SiteServicesProxy =  SiteServicesProxy (facade.retrieveProxy(SiteServicesProxy.NAME));
			proxy.fullLicence = false;
			sendNotification(StateMachine.ACTION,null,ApplicationNotification.TRIAL)
		}
		
		
		public function get view():MainScreen {
			return viewComponent as MainScreen;
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			super.handleNotification(notification);
			switch (notification.getName()) {
			}	
			
		}	
		
	}
}