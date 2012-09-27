package cc.sitemaker.swiz.shell.model.presentation
{
	import cc.sitemaker.swiz.common.FSMModularDemo;
	import cc.sitemaker.swiz.common.events.ServiceEvent;
	import cc.sitemaker.swiz.shell.events.ModuleManagementEvent;
	import cc.sitemaker.swiz.statemachine.StateEvent;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;

	public class ToolbarPresentationModel
	{		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
			
		public  function onRemoveButtton(e:MouseEvent):void{
			dispatcher.dispatchEvent(new ModuleManagementEvent(ModuleManagementEvent.UNLOAD_MODULE));
			trace("onRemoveButtton");
		}
		
		public function onResolveTag(e:MouseEvent):void
		{
			dispatcher.dispatchEvent(new ServiceEvent(ServiceEvent.MOCK));
			trace("onResolveTag");
		}
		
		public function onLoadA(e:MouseEvent):void
		{
			dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.LOAD_POST_TAGS_MODULE,{module:"modules/PostTags.swf"} ));
			trace("onLoadA");
		}
		
		public function onLoadB(e:MouseEvent):void
		{
			dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.LOAD_GLOBAL_TAGS_MODULE,{module:"modules/GlobalTags.swf"} ));
			trace("onLoadB");
		}
		
		public  function onAddDummModule(e:MouseEvent):void
		{
			trace("onAddDummModule");
		}
		
		public function onStartApp (e:MouseEvent):void
		{
			dispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.APP_LOAD_COMPLETED ));
			trace("onStartApp");
		}			
	}
}