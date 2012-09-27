package cc.sitemaker.swiz.common.controller
{
	import cc.sitemaker.swiz.common.FSMModularDemo;
	import cc.sitemaker.swiz.shell.events.ModuleManagementEvent;
	import cc.sitemaker.swiz.statemachine.FSMInjector;
	import cc.sitemaker.swiz.statemachine.StateEvent;
	import cc.sitemaker.swiz.statemachine.StateMachine;
	
	import flash.events.IEventDispatcher;
	
	/* StateController class is defined to manage the different states the dispatcher is in
	 * The states are defined in FSMModularDemo.FSM
	 * The StateMachine manages what can or cannot be changed
	 * In the constructer, the StateController registers listeners for the states 
	 * In the handler for each event, logic to check conditions can be implemented
	*/
	public class StateController
	{		
		public var dispatcher:IEventDispatcher;
				
		public function StateController(disp:IEventDispatcher)
		{
			//var sm:StateMachine = new StateMachine();			
			dispatcher = disp;
			var smInjector:FSMInjector = new FSMInjector( FSMModularDemo.FSM, dispatcher );
			var sm:StateMachine = new StateMachine(dispatcher);
			smInjector.injectStatemachine( sm );
						
			dispatcher.addEventListener(FSMModularDemo.APP_READY_CHANGED, onAppReadyChanged);
			dispatcher.addEventListener(FSMModularDemo.POST_TAGS_ENTERING, onPostTagsEntering);
			dispatcher.addEventListener(FSMModularDemo.GLOBAL_TAGS_ENTERING, onGlobalTagsEntering);
			dispatcher.addEventListener(FSMModularDemo.NON_MODULAR_ENTERING, onNonModularEntering);
		}
		
		private function onAppReadyChanged(e:StateEvent):void{
			
			trace ("Application is started");
		}
		
		private function onPostTagsEntering(e:StateEvent):void{
			
			dispatcher.dispatchEvent(new ModuleManagementEvent(ModuleManagementEvent.LOAD_MODULE, e.data.module));
			trace ("onPostTagsEntering");
		}
		
		private function onGlobalTagsEntering(e:StateEvent):void{
			
			dispatcher.dispatchEvent(new ModuleManagementEvent(ModuleManagementEvent.LOAD_MODULE, e.data.module));
			trace ("onGlobalTagsEntering");
		}
		
		private function onNonModularEntering(e:StateEvent):void{
			
			dispatcher.dispatchEvent(new ModuleManagementEvent(ModuleManagementEvent.LOAD_MODULE, e.data.module));
			trace ("onNonModularEntering");
		}
	}
	
}