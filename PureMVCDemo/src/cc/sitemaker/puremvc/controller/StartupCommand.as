package cc.sitemaker.puremvc.controller
{
	import org.puremvc.as3.multicore.patterns.command.MacroCommand;
	
	public class StartupCommand extends MacroCommand
	{
		protected override function initializeMacroCommand():void 
		{
			
			addSubCommand(ModelPrepCommand);
			addSubCommand(ViewPrepCommand);
		}
	}
	
	 
}