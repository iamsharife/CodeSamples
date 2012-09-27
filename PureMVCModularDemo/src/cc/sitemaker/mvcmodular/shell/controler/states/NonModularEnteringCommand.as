package cc.sitemaker.mvcmodular.shell.controler.states
{
	import cc.sitemaker.mvcmodular.shell.view.ModularDemoMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.MacroCommand;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class NonModularEnteringCommand extends MacroCommand
	{
		protected override function initializeMacroCommand():void {
			addSubCommand(RemoveModuleCommand);
			addSubCommand(LoadModuleCommand);
		}
	}
}