package cc.sitemaker.robotlegs.shell.controller.state
{
	import org.robotlegs.utilities.macro.SequenceCommand;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	public class NonModularEnteringCommand extends SequenceCommand{
		
		[Inject] 
		public var someEvent:StateEvent;
		public override function execute():void{
			
			isAtomic = false;
			addCommand(LoadModuleCommand,someEvent);
			
			super.execute();
		}
	
		
		override protected function commandComplete():void {
			trace("all Good global Tags ")
		}
		override protected function commandIncomplete():void {
			trace("all BAd ")
		} 
	}
}