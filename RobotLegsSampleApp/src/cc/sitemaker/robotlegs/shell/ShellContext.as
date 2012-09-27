package cc.sitemaker.robotlegs.shell
{
	import cc.sitemaker.robotlegs.common.events.GCEvent;
	import cc.sitemaker.robotlegs.common.events.ServiceEvent;
	import cc.sitemaker.robotlegs.common.model.PostTagsModel;
	import cc.sitemaker.robotlegs.common.model.TagsModel;
	import cc.sitemaker.robotlegs.shell.controller.AddWelcomeScreenCommand;
	import cc.sitemaker.robotlegs.shell.controller.MacroStartupCommand;
	import cc.sitemaker.robotlegs.shell.controller.RemoveModuleCommand;
	import cc.sitemaker.robotlegs.shell.controller.services.LoadTagsCommand;
	import cc.sitemaker.robotlegs.shell.view.components.MainScreen;
	import cc.sitemaker.robotlegs.shell.view.mediator.MainMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import modules.PostTags;
	
	import mx.modules.ModuleLoader;
	
	import org.robotlegs.base.CommandMap;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.modular.base.ModuleEventDispatcher;
	import org.robotlegs.utilities.modular.core.IModule;
	import org.robotlegs.utilities.modular.core.IModuleEventDispatcher;
	
	public class ShellContext extends Context
	{
		public function ShellContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void{
			
			commandMap.mapEvent(ContextEvent.STARTUP, MacroStartupCommand, ContextEvent, true );
			commandMap.mapEvent(ServiceEvent.MOCK, LoadTagsCommand, ServiceEvent);
			commandMap.mapEvent(GCEvent.REMOVE_MODULE, RemoveModuleCommand);
			
			mediatorMap.mapView(MainScreen, MainMediator);
						
			//map model
			injector.mapSingleton(TagsModel);
			injector.mapSingleton(PostTagsModel);
					
			// Not that sure about that
			//injector.mapValue(ModuleLoader,RobotLegsModularDemo(contextView).moduleLoader);
			var moduleEventDispatcher:ModuleEventDispatcher = new ModuleEventDispatcher(this.eventDispatcher);
			injector.mapValue(IModuleEventDispatcher, moduleEventDispatcher);
			
			// this is required to allow the module to load, it is the contract in 
			// which the modular utility uses to set up the module context
			viewMap.mapType(IModule); 
			
			// not sure why i have to do this, still need to investigate if this is the right solution.
			// remove the following line to see error that appears without it
			// Happens when unloading a module, even when going to another module.
			viewMap.mapType(IModuleEventDispatcher); 
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}