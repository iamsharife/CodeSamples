package cc.sitemaker.mvcmodular.postags
{

	
	
	import cc.sitemaker.mvcmodular.postags.controler.startup.StartupCommand;
	import cc.sitemaker.mvcmodular.postags.view.PostTagsMainMediator;
	import cc.sitemaker.mvcmodular.shell.model.GlobalTagsProxy;
	import cc.sitemaker.mvcmodular.shell.model.PostTagsProxy;
	
	import modules.ICoreModule;
	
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	import org.puremvc.as3.multicore.utilities.statemachine.StateMachine;
	
	public class PostTagFacade extends Facade
	{	
		public static const NAME:String = "PostTagfacade";
		public static const STARTUP:String = "startup";
		
		public function PostTagFacade(key:String)
		{
			super(key);
		}
		
		public static function getInstance(key:String):PostTagFacade {
			if (instanceMap[key] == null)
				instanceMap[key] = new PostTagFacade(key);
			return instanceMap[key] as PostTagFacade;
		}
		
		public function startup(app:ICoreModule):void {
			sendNotification(STARTUP, app);
		}

		public function dispose():void
		{	
			
			removeCommand(STARTUP);
			removeMediator(PostTagsMainMediator.NAME);
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