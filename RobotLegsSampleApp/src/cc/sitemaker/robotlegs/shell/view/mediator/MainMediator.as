package cc.sitemaker.robotlegs.shell.view.mediator
{
	import cc.sitemaker.robotlegs.common.FSMModularDemo;
	import cc.sitemaker.robotlegs.common.events.GCEvent;
	import cc.sitemaker.robotlegs.common.events.ServiceEvent;
	import cc.sitemaker.robotlegs.shell.view.components.MainScreen;
	
	import flash.events.MouseEvent;
	
	import mx.core.ContainerGlobals;
	
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	public class MainMediator extends Mediator
	{
		[Inject]public var view:MainScreen;
		
		public function MainMediator()
		{
		}
		
		override public function onRegister():void{
			trace ("main view Ready");
			//  setup the event listening toward the view
			eventMap.mapListener(view.startAppButton, MouseEvent.CLICK, onStartApp);
			eventMap.mapListener(view.loadModuleAButton, MouseEvent.CLICK, onLoadA);
			eventMap.mapListener(view.loadModuleBButton, MouseEvent.CLICK, onLoadB);
			eventMap.mapListener(view.resolveServiceButton, MouseEvent.CLICK, onResolveTag);
			eventMap.mapListener(view.removeModuleButton, MouseEvent.CLICK, onRemoveButtton);
			eventMap.mapListener(view.removeModuleButton, MouseEvent.CLICK, onRemoveButtton);
			eventMap.mapListener(view.loadDummModuleButton, MouseEvent.CLICK, onAddDummModule);
		}
		
		public override function onRemove():void{
			trace ('on mainView Mediator Remove')
		}
		
		
		public  function onRemoveButtton(e:MouseEvent):void{
			eventDispatcher.dispatchEvent( new GCEvent(GCEvent.REMOVE_MODULE));
		}
		
		public function onResolveTag(e:MouseEvent):void
		{
			eventDispatcher.dispatchEvent( new ServiceEvent(ServiceEvent.MOCK)); 
		}
		public function onLoadA(e:MouseEvent):void
		{
			trace ("trigger a state Change via  : "  + FSMModularDemo.LOAD_POST_TAGS_MODULE);
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.LOAD_POST_TAGS_MODULE,{module:"modules/PostTags.swf"} ));
		}
		
		public function onLoadB(e:MouseEvent):void
		{
			trace ("trigger a state Change via  : "  + FSMModularDemo.LOAD_GLOBAL_TAGS_MODULE);
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.LOAD_GLOBAL_TAGS_MODULE,{module:"modules/GlobalTags.swf"} ));
		}
		
		public  function onAddDummModule(e:MouseEvent):void{
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.LOAD_NON_MODULAR,{module:"modules/NonModularModule.swf"} ))
		}
		
		public function onStartApp (e:MouseEvent):void{
			trace ("trigger a state Change via  : "  + FSMModularDemo.APP_LOAD_COMPLETED);
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.APP_LOAD_COMPLETED ));
		}
		
	}
}