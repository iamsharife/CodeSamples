package cc.sitemaker.robotlegs.blog.controller
{
	import cc.sitemaker.robotlegs.blog.view.components.BlogMain;
	
	import modules.Blog;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	public class BlogStartupCommand extends Command
	{
		override public function execute():void{
			
			var blogMain: BlogMain = new BlogMain ();
			(contextView as Blog).addElement(blogMain);
			
			var blogMain2: BlogMain = new BlogMain ();
			(contextView as Blog).addElement(blogMain2);
			
			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
		}
	}
}