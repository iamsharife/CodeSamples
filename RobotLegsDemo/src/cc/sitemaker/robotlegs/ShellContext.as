package cc.sitemaker.robotlegs
{
	import cc.sitemaker.robotlegs.controller.StartupCommand;
	import cc.sitemaker.robotlegs.view.components.WelcomeScreen;
	import cc.sitemaker.robotlegs.view.mediator.WelcomeScreenMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	public class ShellContext extends Context
	{
		public function ShellContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void{
			
			// Map Events to Commands
			commandMap.mapEvent(ContextEvent.STARTUP, StartupCommand, ContextEvent, true);
			
			// Map Views to Meditators
			mediatorMap.mapView(WelcomeScreen, WelcomeScreenMediator);			
			
			// Dispatch Event to call the StartupCommand
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}