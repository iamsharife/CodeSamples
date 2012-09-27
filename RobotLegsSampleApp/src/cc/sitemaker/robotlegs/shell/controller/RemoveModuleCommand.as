package cc.sitemaker.robotlegs.shell.controller
{
	import cc.sitemaker.robotlegs.common.CacheModuleLoader;
	import cc.sitemaker.robotlegs.common.FSMModularDemo;
	import cc.sitemaker.robotlegs.shell.view.components.MainScreen;
	
	import flash.display.DisplayObjectContainer;
	import flash.system.System;
	
	import mx.core.IVisualElement;
	import mx.modules.ModuleLoader;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModule;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	import spark.components.Application;
	
	public class RemoveModuleCommand extends Command
	{		
		override public function execute():void{
			var modulLoader:ModuleLoader = RobotLegsSampleApp(contextView).appLoader ; 
			if (modulLoader.child){
				if (modulLoader.child is IModule){	
					IModule(modulLoader.child).dispose();
				}
				modulLoader.unloadModule();
				modulLoader.url =  null;
				modulLoader.applicationDomain = null;
			}
			
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.APP_LOAD_COMPLETED ));
			System.gc();
			
		}
	}
}