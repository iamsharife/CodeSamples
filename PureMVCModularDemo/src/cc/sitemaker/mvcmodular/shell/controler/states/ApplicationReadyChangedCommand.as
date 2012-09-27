package cc.sitemaker.mvcmodular.shell.controler.states
{
	import cc.sitemaker.mvcmodular.shell.view.ModularDemoMediator;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ApplicationReadyChangedCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			
				trace ("application ready change ")
		}
	}
}