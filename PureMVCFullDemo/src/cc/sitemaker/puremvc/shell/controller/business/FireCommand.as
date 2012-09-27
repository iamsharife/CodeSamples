package cc.sitemaker.puremvc.shell.controller.business
{
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class FireCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			trace ('a command has been invocated');
		}
	}
}