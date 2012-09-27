package supportClasses
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.events.ModuleEvent;
	import mx.modules.ModuleLoader;
	
	import supportClasses.events.SMModuleEvent;
	
	public class AppContainerHelper extends EventDispatcher
	{
		private var _target:IEventDispatcher;
		
		private var lastSMModuleEvent:SMModuleEvent;
		
		public function AppContainerHelper(target:IEventDispatcher=null)
		{
			super(target);
			_target = target;
			
			target.addEventListener(SMModuleEvent.LOAD_MODULE, onLoadModule);	
			target.addEventListener(SMModuleEvent.MODULE_CREATION_COMPLETE, onModuleCreationComplete);
			target.addEventListener(SMModuleEvent.EXIT_MODULE, onExitModule);
			getAppContainer().appLoader.addEventListener(ModuleEvent.READY, onModuleReady);
		}
		
		
		private function getAppContainer():ModuleSpikeWithoutFramework{
			return _target as ModuleSpikeWithoutFramework;
		}
				
		private function onModuleCreationComplete(e:SMModuleEvent):void
		{
			// TODO Auto Generated method stub
			var app:IApp = getAppContainer().appLoader.child as IApp;
			app.viewCurrentState = lastSMModuleEvent.newState;
		}
		
		private function onModuleReady(e:ModuleEvent):void{
			//load last requested state
			
			
		}
		
		private function logIt(message:String):void{
			trace("AppContainerEventMap::logIt",message);
		}
		
		private function onExitModule(e:SMModuleEvent):void{
			trace("AppContainerEventMap::onExitModule", e.newModule);
			getAppContainer().appLoader.unloadModule();
			getAppContainer().appLoader.url = e.newModule;
			lastSMModuleEvent = e.clone() as SMModuleEvent;
		}
		
		private function onLoadModule(e:SMModuleEvent):void{
			trace("AppContainerEventMap::onLoadModule", e.newModule);
			var appLoader:ModuleLoader = getAppContainer().appLoader;
			
			lastSMModuleEvent = e.clone() as SMModuleEvent;
			
			if (!appLoader.url){
				appLoader.url = e.newModule;
			} else {
				var app:IApp = appLoader.child as IApp;
				if (appLoader.url == e.newModule){
					// do a refresh?
				} else {
					app.moduleChangeRequest(lastSMModuleEvent);
				}
			}
		}
	}
}