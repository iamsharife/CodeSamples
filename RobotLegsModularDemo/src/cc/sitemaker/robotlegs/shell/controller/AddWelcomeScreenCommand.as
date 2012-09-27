package cc.sitemaker.robotlegs.shell.controller
{
	import cc.sitemaker.robotlegs.shell.view.components.MainScreen;
	
	import flash.display.DisplayObjectContainer;
	
	import mx.core.IVisualElement;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	import spark.components.Application;
	
	public class AddWelcomeScreenCommand extends Command
	{		
		override public function execute():void{
						
			var main: MainScreen = new MainScreen ();
			(contextView as Application).addElement(main);
			
		}
	}
}