package cc.sitemaker.mvcmodular.shell.controler.startup
{
	import cc.sitemaker.mvcmodular.shell.StateMachineDefinition;
	import cc.sitemaker.mvcmodular.shell.controler.states.ApplicationReadyChangedCommand;
	import cc.sitemaker.mvcmodular.shell.controler.states.GlobalTagsEnteringCommand;
	import cc.sitemaker.mvcmodular.shell.controler.states.NonModularEnteringCommand;
	import cc.sitemaker.mvcmodular.shell.controler.states.PostTagsEnteringCommand;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.puremvc.as3.multicore.utilities.statemachine.FSMInjector;

	public class InjectFSMCommand extends SimpleCommand
	{
		override public function execute(note:INotification):void
		{	
			//  Inject the State Machine
			var fsm:XML= StateMachineDefinition.FSM;
			var injector:FSMInjector = new FSMInjector(fsm);
			injector.initializeNotifier(this.multitonKey);
			injector.inject();
			
			//  setup command related to State 
			
			facade.registerCommand(StateMachineDefinition.APP_READY_CHANGED, ApplicationReadyChangedCommand);
			facade.registerCommand( StateMachineDefinition.POST_TAGS_ENTERING, PostTagsEnteringCommand);
			facade.registerCommand( StateMachineDefinition.GLOBAL_TAGS_ENTERING, GlobalTagsEnteringCommand );
			facade.registerCommand( StateMachineDefinition.NON_MODULAR_ENTERING, NonModularEnteringCommand);
		}
	}
}