package cc.sitemaker.robotlegs.shell.view.mediator
{
	import cc.sitemaker.robotlegs.common.FSMModularDemo;
	import cc.sitemaker.robotlegs.shell.view.components.MainScreen;
	
	import flash.events.MouseEvent;
	
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
		}
		
		public override function onRemove():void{
			trace ('on mainView Mediator Remove')
		}
		
		
		private function onLoadA(e:MouseEvent):void
		{
			trace ("trigger a state Change via  : "  + FSMModularDemo.LOAD_MODULE_A);
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.LOAD_MODULE_A,{module:"modules/Blog.swf"} ));
		}
		
		private function onLoadB(e:MouseEvent):void
		{
			trace ("trigger a state Change via  : "  + FSMModularDemo.LOAD_MODULE_B);
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.LOAD_MODULE_B ));
		}
		
	
		
		private function onStartApp (e:MouseEvent):void{
			trace ("trigger a state Change via  : "  + FSMModularDemo.APP_LOAD_COMPLETED);
			eventDispatcher.dispatchEvent( new StateEvent( StateEvent.ACTION, FSMModularDemo.APP_LOAD_COMPLETED ));
		}
		
	}
}