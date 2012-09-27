package cc.sitemaker.robotlegs.controller
{
	import cc.sitemaker.robotlegs.view.components.WelcomeScreen;
	
	import flash.display.DisplayObjectContainer;
	
	import mx.core.IVisualElement;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	import spark.components.Application;
	
	public class StartupCommand extends Command
	{		
		override public function execute():void{
			
			// New welcome view is defined, and added to the applications container
			var welcome: WelcomeScreen = new WelcomeScreen ();
			(contextView as Application).addElement(welcome);
			
			// Dispatch a completion event to notify the Context, start up has completed.
			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
		}
	}
}