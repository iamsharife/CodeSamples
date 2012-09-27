package cc.sitemaker.robotlegs.shell.controller.state
{
	import org.robotlegs.mvcs.Command;
	
	public class ApplicationReadyChangedCommand extends Command
	{
		public override function execute():void{
			trace ("Application is started");
			
			
		}
	}
}