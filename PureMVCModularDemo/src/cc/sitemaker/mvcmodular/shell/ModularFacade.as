package cc.sitemaker.mvcmodular.shell
{

	
	import cc.sitemaker.mvcmodular.shell.controler.ClearApplicationCommand;
	import cc.sitemaker.mvcmodular.shell.controler.data.RetrieveTagsCommand;
	import cc.sitemaker.mvcmodular.shell.controler.startup.StartupCommand;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import org.puremvc.as3.multicore.utilities.statemachine.StateMachine;
	
	public class ModularFacade extends Facade
	{	
		public static const NAME:String = "pmvcDemo";
		public static const STARTUP:String = "startup";
		
		public function ModularFacade(key:String)
		{
			super(key);
		}
		
		public static function getInstance(key:String):ModularFacade {
			if (instanceMap[key] == null)
				instanceMap[key] = new ModularFacade(key);
			return instanceMap[key] as ModularFacade;
		}
		
		public function startup(app:PureMVCModularDemo):void {
			sendNotification(STARTUP, app);
		}
		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
			registerCommand(ApplicationNotification.RESOLVE_TAGS,RetrieveTagsCommand);
			registerCommand(ApplicationNotification.UNLOAD_ALL,ClearApplicationCommand);
			
			
			//  Command for the state Machine
		
			;
		}
	}
}