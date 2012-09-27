package cc.sitemaker.mvcmodular.shell.controler.startup
{
	
	import cc.sitemaker.mvcmodular.shell.model.GlobalTagsProxy;
	import cc.sitemaker.mvcmodular.shell.model.PostTagsProxy;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ModelPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			trace ("initialize model : Proxy");
			var globalTagProxy : GlobalTagsProxy = new GlobalTagsProxy ();
			facade.registerProxy(globalTagProxy);
			
			var postTagProxy : PostTagsProxy = new PostTagsProxy ();
			facade.registerProxy(postTagProxy);
		}
	}
}