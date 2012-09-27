package cc.sitemaker.robotlegs.globaltags.controller
{
	import cc.sitemaker.robotlegs.globaltags.view.components.GlobalTagsMainView;
	
	import modules.GlobalTags;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	public class SiteServicesStartupCommand extends Command
	{
		override public function execute():void{
			
			var siteServicesMain: GlobalTagsMainView = new GlobalTagsMainView ();
			(contextView as GlobalTags).addElement(siteServicesMain);
			
			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
		}
	}
}