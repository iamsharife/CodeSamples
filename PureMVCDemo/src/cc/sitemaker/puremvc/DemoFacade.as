package cc.sitemaker.puremvc
{
	import cc.sitemaker.puremvc.controller.StartupCommand;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
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
		
		public function startup(app:PureMVCDemo):void {
			sendNotification(STARTUP, app);
		}
		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
		}
	}
}