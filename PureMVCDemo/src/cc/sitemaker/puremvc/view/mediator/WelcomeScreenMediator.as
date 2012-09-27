package cc.sitemaker.puremvc.view.mediator
{
	import cc.sitemaker.puremvc.view.components.WelcomeScreen;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class WelcomeScreenMediator extends Mediator
	{	
		public static const NAME:String = "welcomeMediator";
		
		public function WelcomeScreenMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		public override function onRegister():void{
			trace (NAME+' has been register')
		}
		public override function onRemove():void{
			
		}

		
		public function get view():WelcomeScreen {
			return viewComponent as WelcomeScreen;
		}
		
		override public function handleNotification(notification:INotification):void 
		{
			super.handleNotification(notification);
			switch (notification.getName()) {
			}	
			
		}	
		
	}
}