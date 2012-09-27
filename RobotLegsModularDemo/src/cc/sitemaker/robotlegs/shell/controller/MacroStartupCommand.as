package cc.sitemaker.robotlegs.shell.controller
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.utilities.macro.SequenceCommand;

	
	public class MacroStartupCommand extends SequenceCommand
	{
		override public function execute():void {
			isAtomic = false;
			
			addCommand(AddWelcomeScreenCommand);
			addCommand(ConfigueStateMachineCommand);
			
			super.execute();
		}
		
		override protected function commandComplete():void {
			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
			trace("Ive completed the command executions i needed to do");
		}
	}
}