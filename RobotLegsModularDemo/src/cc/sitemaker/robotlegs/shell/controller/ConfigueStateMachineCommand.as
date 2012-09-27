package cc.sitemaker.robotlegs.shell.controller
{
	import cc.sitemaker.robotlegs.common.FSMModularDemo;
	import cc.sitemaker.robotlegs.shell.controller.state.ApplicationReadyChangedCommand;
	import cc.sitemaker.robotlegs.shell.controller.state.ModuleAEnteringCommand;
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.FSMInjector;
	import org.robotlegs.utilities.statemachine.State;
	import org.robotlegs.utilities.statemachine.StateEvent;
	import org.robotlegs.utilities.statemachine.StateMachine;
	
	/**
	 * Setup a FSM with Robotlegs
	 * FSM purpose : controle the execution of modules setup, cleanup, changes. 
	 * This command is part of the application startup.
	 * @author Sharif/Guillaume 
	 * 
	 */	
	public class ConfigueStateMachineCommand extends Command
	{
		override public function execute():void
		{
			var smInjector:FSMInjector = new FSMInjector( FSMModularDemo.FSM );
			var sm:StateMachine = new StateMachine(eventDispatcher);
			
			// register Command for Change command 
			commandMap.mapEvent( FSMModularDemo.APP_READY_CHANGED, ApplicationReadyChangedCommand );
			commandMap.mapEvent( FSMModularDemo.MODULE_A_ENTERING, ModuleAEnteringCommand,Object );
			smInjector.inject( sm );		
		}
	}
}