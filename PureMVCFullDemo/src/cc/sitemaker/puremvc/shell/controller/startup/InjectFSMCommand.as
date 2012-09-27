package cc.sitemaker.puremvc.shell.controller.startup
{
	import cc.sitemaker.puremvc.shell.ApplicationNotification;
	import cc.sitemaker.puremvc.shell.StateVersion;
	
	import flashx.textLayout.tlf_internal;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	import org.puremvc.as3.multicore.utilities.statemachine.FSMInjector;

	public class InjectFSMCommand extends SimpleCommand
	{
		override public function execute(note:INotification):void
		{
			var fsm:XML=<fsm initial={StateVersion.TRIAL}>


					<state name={StateVersion.TRIAL} changed={ApplicationNotification.DISPLAY_MAIN_SCREEN} >
						<transition action={ApplicationNotification.BUY} target={StateVersion.BUY}/>
					</state>
					<state name={StateVersion.BUY} entering={ApplicationNotification.BUY} exiting ={ApplicationNotification.EXIT_BUY_FEATURE} >
						<transition action={ApplicationNotification.FULL_VERSION} target={StateVersion.FULL_VERSION}/>
						<transition action={ApplicationNotification.TRIAL} target={StateVersion.TRIAL}/>
					</state>
					<state name={StateVersion.FULL_VERSION} changed={ApplicationNotification.DISPLAY_MAIN_SCREEN} >
						<transition action={ApplicationNotification.TRIAL} target={StateVersion.TRIAL}/>
					</state>

				</fsm>;
			var injector:FSMInjector = new FSMInjector(fsm);
			injector.initializeNotifier(this.multitonKey);
			injector.inject();
		}
	}
}