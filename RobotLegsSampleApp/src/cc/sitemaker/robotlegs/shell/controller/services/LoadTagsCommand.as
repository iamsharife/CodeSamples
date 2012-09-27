package cc.sitemaker.robotlegs.shell.controller.services
{
	import cc.sitemaker.robotlegs.common.model.TagsModel;
	import cc.sitemaker.robotlegs.common.model.services.TagsResolverService;
	
	import flash.events.Event;
	
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.Command;
	
	public class LoadTagsCommand extends Command
	{
		
	
		[Inject]public var globalTagsModel:TagsModel;
		
		public override function execute():void{
			trace (' resolve Tags Command');
			commandMap.detain(this);
			var service : TagsResolverService = new TagsResolverService ();
			service.addEventListener(ResultEvent.RESULT, onResolved);
			service.resolve();
		}
		
		
		private function onResolved (e:ResultEvent):void{
			globalTagsModel.populateFromObject(e.result as Array);
			commandMap.release(this);
		}
		
	}
}