package cc.sitemaker.mvcmodular.globaltags
{

	
	
	
	import cc.sitemaker.mvcmodular.globaltags.controler.startup.StartupCommand;
	import cc.sitemaker.mvcmodular.globaltags.view.GlobalTagMediator;
	import cc.sitemaker.mvcmodular.shell.model.GlobalTagsProxy;
	import cc.sitemaker.mvcmodular.shell.model.PostTagsProxy;
	
	import modules.ICoreModule;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import org.puremvc.as3.multicore.utilities.statemachine.StateMachine;
	
	public class GlobalTagFacade extends Facade
	{	
		public static const NAME:String = "GlobalTagfacade";
		public static const STARTUP:String = "startup";
		
		public function GlobalTagFacade(key:String)
		{
			super(key);
		}
		
		public static function getInstance(key:String):GlobalTagFacade {
			if (instanceMap[key] == null)
				instanceMap[key] = new GlobalTagFacade(key);
			return instanceMap[key] as GlobalTagFacade;
		}
		
		public function startup(app:ICoreModule):void {
			sendNotification(STARTUP, app);
		}

		public function dispose():void
		{	//  yeap ..  remove everything yourself ... 
			//  painfull but better results at the end...
			removeCommand(STARTUP);
			removeMediator(GlobalTagMediator.NAME);
			removeProxy(GlobalTagsProxy.NAME);
			removeProxy(PostTagsProxy.NAME);
			Facade.removeCore(this.multitonKey);
		}
		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(STARTUP, StartupCommand);
			
			
			//  Command for the state Machine
		
			;
		}
	}
}