package cc.sitemaker.robotlegs.shell
{
	import cc.sitemaker.robotlegs.common.model.DataModel;
	import cc.sitemaker.robotlegs.shell.controller.AddWelcomeScreenCommand;
	import cc.sitemaker.robotlegs.shell.controller.MacroStartupCommand;
	import cc.sitemaker.robotlegs.shell.view.components.MainScreen;
	import cc.sitemaker.robotlegs.shell.view.mediator.MainMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import mx.modules.ModuleLoader;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.modular.core.IModule;
	
	public class ShellContext extends Context
	{
		public function ShellContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void{
			
			commandMap.mapEvent(ContextEvent.STARTUP, MacroStartupCommand, ContextEvent, true );
			
			mediatorMap.mapView(MainScreen, MainMediator);
						
			//map model
			injector.mapSingleton(DataModel);
			
			// Not that sure about that
			injector.mapValue(ModuleLoader,RobotLegsModularDemo(contextView).moduleLoader);
			
			// this is required to allow the module to load, it is the contract in 
			// which the modular utility uses to set up the module context
			viewMap.mapType(IModule); 
			
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}