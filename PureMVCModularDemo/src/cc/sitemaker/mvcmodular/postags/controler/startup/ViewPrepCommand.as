package cc.sitemaker.mvcmodular.postags.controler.startup
{
	import cc.sitemaker.mvcmodular.postags.view.PostTagsMainMediator;
	import cc.sitemaker.mvcmodular.shell.view.MainMediator;
	import cc.sitemaker.mvcmodular.shell.view.MainScreen;
	import cc.sitemaker.mvcmodular.shell.view.ModularDemoMediator;
	
	import modules.PostTags;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class ViewPrepCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
		
			var app : PostTags = PostTags (notification.getBody()); 
			var postMediator  : PostTagsMainMediator =new PostTagsMainMediator(app.main); 
			facade.registerMediator(postMediator);
		}
	}
}