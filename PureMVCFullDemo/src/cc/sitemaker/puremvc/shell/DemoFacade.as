package cc.sitemaker.puremvc.shell
{
	import cc.sitemaker.puremvc.shell.controller.business.FireCommand;
	import cc.sitemaker.puremvc.shell.controller.startup.StartupCommand;
	import cc.sitemaker.puremvc.shell.controller.state.EnteringBuy;
	import cc.sitemaker.puremvc.shell.controller.state.EnteringMain;
	import cc.sitemaker.puremvc.shell.controller.state.ExitingBuy;
	
	import mx.utils.OnDemandEventDispatcher;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import org.puremvc.as3.multicore.utilities.statemachine.StateMachine;
	
	public class DemoFacade extends Facade
	{	
		public static const NAME:String = "pmvcDemo";
		public static const STARTUP:String = "startup";
		
		public function DemoFacade(key:String)
		{
			super(key);
		}
		
		public static function getInstance(key:String):DemoFacade {
			if (instanceMap[key] == null)
				instanceMap[key] = new DemoFacade(key);
			return instanceMap[key] as DemoFacade;
		}
		
		public function startup(app:PureMVCFullDemo):void {
			sendNotification(STARTUP, app);
		}
		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
			
			
			// State related Commands
			registerCommand(ApplicationNotification.BUY, EnteringBuy);
			registerCommand(ApplicationNotification.EXIT_BUY_FEATURE, ExitingBuy);
			registerCommand(StateMachine.CHANGED, EnteringMain);
			
			// Application command 
			registerCommand(ApplicationNotification.FIRE_COMMAND, FireCommand);
			;
		}
	}
}