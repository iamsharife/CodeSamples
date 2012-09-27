package cc.sitemaker.mvcmodular.shell.view
{
	import cc.sitemaker.mvcmodular.shell.ApplicationNotification;
	import cc.sitemaker.mvcmodular.shell.StateMachineDefinition;
	import cc.sitemaker.mvcmodular.shell.view.MainScreen;
	
	import flash.events.MouseEvent;
	
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	import org.puremvc.as3.multicore.utilities.statemachine.StateMachine;
	
	
	public class MainMediator extends Mediator
	{
		;
		
		public static const NAME:String = "Main Mediator";
		public function MainMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		
		public function get view ():MainScreen 
		{
			return viewComponent  as MainScreen
		}
		
		override public function onRegister():void{
			trace ("main view Ready");
			view.startAppButton.addEventListener(MouseEvent.CLICK,onStartApp);
			view.loadModuleAButton.addEventListener(MouseEvent.CLICK,onLoadA);
			view.loadModuleBButton.addEventListener(MouseEvent.CLICK,onLoadB);
			view.resolveServiceButton.addEventListener(MouseEvent.CLICK,onResolveTag);
			view.removeModuleButton.addEventListener(MouseEvent.CLICK,onRemoveButtton);
			view.loadDummModuleButton.addEventListener(MouseEvent.CLICK,onAddDummModule);
		}
		
		public override function onRemove():void{
			//  DO it yourself... 
			view.startAppButton.removeEventListener(MouseEvent.CLICK,onStartApp);
			view.loadModuleAButton.removeEventListener(MouseEvent.CLICK,onLoadA);
			view.loadModuleBButton.removeEventListener(MouseEvent.CLICK,onLoadB);
			view.resolveServiceButton.removeEventListener(MouseEvent.CLICK,onResolveTag);
			view.removeModuleButton.removeEventListener(MouseEvent.CLICK,onRemoveButtton);
			view.loadDummModuleButton.removeEventListener(MouseEvent.CLICK,onAddDummModule);
		}
		
		
		public  function onRemoveButtton(e:MouseEvent):void{
			sendNotification(ApplicationNotification.UNLOAD_ALL,null);
		}
		
		private function onResolveTag(e:MouseEvent):void
		{
			sendNotification(ApplicationNotification.RESOLVE_TAGS,null);
		}
		private function onLoadA(e:MouseEvent):void
		{
			sendNotification(StateMachine.ACTION,{module:"modules/PostTags.swf"},StateMachineDefinition.LOAD_POST_TAGS_MODULE);
		}
		
		private function onLoadB(e:MouseEvent):void
		{
			sendNotification(StateMachine.ACTION,{module:"modules/GlobalTags.swf"},StateMachineDefinition.LOAD_GLOBAL_TAGS_MODULE);
		}
		
		public  function onAddDummModule(e:MouseEvent):void{
			sendNotification(StateMachine.ACTION,{module:"modules/NonModularModule.swf"},StateMachineDefinition.LOAD_NON_MODULAR);
		}
		
		private function onStartApp (e:MouseEvent):void{
			sendNotification(StateMachine.ACTION,null,StateMachineDefinition.APP_LOAD_COMPLETED);
		}
		
	}
}