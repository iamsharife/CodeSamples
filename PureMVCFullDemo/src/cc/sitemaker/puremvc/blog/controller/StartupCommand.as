package cc.sitemaker.puremvc.blog.controller
{
	import cc.sitemaker.puremvc.blog.view.mediator.BlogModuleMediator;
	
	import modules.Blog;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

	public class StartupCommand extends SimpleCommand
	{
		override public function execute(note:INotification):void
		{			
			/*
			* Create and register the HelloModule and its Mediator for this
			* module instance.
			*/
			var blogModule:Blog = note.getBody() as Blog;
			var blogModuleMediator:BlogModuleMediator = new BlogModuleMediator( blogModule );
			facade.registerMediator( blogModuleMediator );
		}

	}
}