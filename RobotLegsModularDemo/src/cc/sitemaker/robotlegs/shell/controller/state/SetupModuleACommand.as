package cc.sitemaker.robotlegs.shell.controller.state
{
	import org.robotlegs.mvcs.Command;
	
	public class SetupModuleACommand extends Command
	{
		override public function execute():void{
			trace ("setup my module");
		}
	}
} 