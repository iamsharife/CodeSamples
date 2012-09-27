package cc.sitemaker.robotlegs.shell.controller
{
	import cc.sitemaker.robotlegs.common.FSMModularDemo;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	public class LoadModuleCommand extends Command
	{
		[Inject]
		public var myEvent:StateEvent;
		
		
		
		
		override public function execute():void{
			
			
			
			//eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.STARTING ));
		}
	}
}