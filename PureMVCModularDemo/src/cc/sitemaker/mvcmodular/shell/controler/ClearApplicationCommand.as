package cc.sitemaker.mvcmodular.shell.controler
{
	import cc.sitemaker.mvcmodular.shell.controler.states.RemoveModuleCommand;
	
	import org.puremvc.as3.multicore.patterns.command.MacroCommand;
	
	public class ClearApplicationCommand extends MacroCommand
	{
		protected override function initializeMacroCommand():void 
		{
			
			addSubCommand(RemoveModuleCommand);
			addSubCommand(BackToReadyStateCommand);
		}	
	}
}