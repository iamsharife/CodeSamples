package cc.sitemaker.swiz.common.controller
{
	import cc.sitemaker.swiz.common.model.TagsModel;
	import cc.sitemaker.swiz.common.services.ITagDelegate;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.OnDemandEventDispatcher;
	
	import org.swizframework.utils.services.IServiceHelper;
	import org.swizframework.utils.services.ServiceHelper;

	public class TagController
	{
		/* Injected, if it hasnt been created already, it will be for the first time
		*/
		[Inject]
		public var delegate:ITagDelegate;
		
		[Inject]
		public var serviceHelper:IServiceHelper;
		
		[Inject]
		public var tagsModel:TagsModel;
		
		public function TagController()
		{
		}
		
		[EventHandler ( event="ServiceEvent.MOCK")]
		public function callGetTags():void{			
			serviceHelper.executeServiceCall(delegate.getTags(), onResult, onFault);
		}
		
		private function onResult(e:ResultEvent):void{
			tagsModel.populateFromObject(e.result as Array);
		}
		
		private function onFault(e:FaultEvent):void{
			
		}
		
		
		
		
	}
}