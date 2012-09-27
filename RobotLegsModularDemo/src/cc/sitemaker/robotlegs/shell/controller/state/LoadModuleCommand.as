package cc.sitemaker.robotlegs.shell.controller.state
{
	import mx.events.ModuleEvent;
	import mx.modules.ModuleLoader;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	public class LoadModuleCommand extends Command
	{
		[Inject] 
		public var state:StateEvent;
		
		[Inject] 
		public var moduleLoader : ModuleLoader;
		
		public override function execute():void{
			moduleLoader.url = state.data.module;
			moduleLoader.addEventListener(ModuleEvent.READY, onModuleReady);
			moduleLoader.loadModule ();
			
		}
		
		private function onModuleReady (e:ModuleEvent):void{
			trace ("Module Ready")
		}
	}
}