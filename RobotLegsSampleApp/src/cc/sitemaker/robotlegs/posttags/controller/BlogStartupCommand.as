package cc.sitemaker.robotlegs.posttags.controller
{
	import cc.sitemaker.robotlegs.posttags.view.components.PostTagsMainView;
	
	import modules.PostTags;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	public class BlogStartupCommand extends Command
	{
		override public function execute():void{
			
			var blogMain: PostTagsMainView = new PostTagsMainView ();
			(contextView as PostTags).addElement(blogMain);
						
			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
		}
	}
}