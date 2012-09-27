package cc.sitemaker.mvcmodular.shell.controler.data
{
	import cc.sitemaker.mvcmodular.shell.model.GlobalTagsProxy;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class RetrieveTagsCommand extends SimpleCommand
	{
		override public function execute(note:INotification):void
		{	
			trace ("update tags");
			var globalTagProxy : GlobalTagsProxy = GlobalTagsProxy( facade.retrieveProxy(GlobalTagsProxy.NAME));
			globalTagProxy.resolve();
		}
	}
}