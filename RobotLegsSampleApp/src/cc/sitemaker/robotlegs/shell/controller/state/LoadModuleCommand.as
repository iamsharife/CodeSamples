package cc.sitemaker.robotlegs.shell.controller.state
{
	import flash.system.ApplicationDomain;
	import flash.system.System;
	
	import modules.PostTags;
	
	import mx.core.IVisualElement;
	import mx.events.ModuleEvent;
	import mx.modules.Module;
	import mx.modules.ModuleLoader;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.modular.core.IModule;
	import org.robotlegs.utilities.statemachine.StateEvent;

	/**
	 * Load and create a module instance  
	 * @author guillaume
	 * 
	 */	
	public class LoadModuleCommand extends Command
	{
		[Inject] 
		public var state:StateEvent;
		
		public override function execute():void{
			var modulLoader:ModuleLoader = RobotLegsSampleApp(contextView).appLoader ; 
			trace("LoadModuleCommand::ModuleUrl:",modulLoader.url,"state.data.module:",state.data.module);
			
			if (modulLoader.url == state.data.module)
				return;
			
			if (modulLoader.url && modulLoader.url != state.data.module ){
				trace("LoadModuleCommand::DifferentModule");
				if (modulLoader.child is IModule){
					IModule (modulLoader.child).dispose();
				}
					
				modulLoader.unloadModule();
				modulLoader.url = null;
				modulLoader.applicationDomain = null;
				System.gc();
			}
			
			var childDomain:ApplicationDomain = 
				new ApplicationDomain(ApplicationDomain.currentDomain);
			
			modulLoader.applicationDomain = childDomain;

			modulLoader.url = state.data.module;
			modulLoader.addEventListener(ModuleEvent.READY, onModuleReady);
			modulLoader.loadModule ();
		}
		
		private function onModuleReady (e:ModuleEvent):void{
			var modulLoader:ModuleLoader = RobotLegsSampleApp(contextView).appLoader ; 
			trace ("Module Ready");
			//  bad practice ! - should be delegate to mediator (i.e. dispatch event for mediator to react to
			modulLoader.removeEventListener(ModuleEvent.READY, onModuleReady);
		
		}
	}
}