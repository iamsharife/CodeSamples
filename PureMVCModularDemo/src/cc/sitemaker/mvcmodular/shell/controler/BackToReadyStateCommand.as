package cc.sitemaker.mvcmodular.shell.controler
{
	import cc.sitemaker.mvcmodular.shell.StateMachineDefinition;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.puremvc.as3.multicore.utilities.statemachine.StateMachine;
	
	public class BackToReadyStateCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			sendNotification(StateMachine.ACTION,null,StateMachineDefinition.APP_LOAD_COMPLETED);
		}
	}
}