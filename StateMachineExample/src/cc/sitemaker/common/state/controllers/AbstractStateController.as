package cc.sitemaker.common.state.controllers
{
	import cc.sitemaker.common.state.interfaces.IState;
	import cc.sitemaker.common.state.interfaces.IStateMachine;
	import cc.sitemaker.common.state.interfaces.IStateView;
	import cc.sitemaker.common.state.model.StateModel;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.core.UIComponent;
	
	public class AbstractStateController extends EventDispatcher implements IStateMachine
	{
		private static var SUCCESS:String = ActionEvent.SUCCESS;
		private static var FAILURE:String = ActionEvent.FAILURE;
		private static var VALIDATION_ERROR:String = ActionEvent.VALIDATION_ERROR;
		private static var DEFAULT:String = ActionState.DEFAULT;
		
		private var offset:Point;
		
		private var state:IState;
		private var view:IStateView;
		private var model:StateModel;
		
		private var container:UIComponent;
		
		public function AbstractStateController(container:UIComponent,model:StateModel) {
			view = null;
			state=null;
			model = model;
			container = container;
		}
		
		public function setState(state:IState):void
		{
			state.setPreviousState(state);
			changeState(state);
		}
		
		private function changeState(state:IState){
			
			if (state instanceof IActionState) {
				log.info("state is actionState");
				state.performAction(DEFAULT,view);
			}
			else {
				state = state;
				view = loadView(state.getViewFactory());
				view.setStateMachine(this);
			}
		}
		
		private function goBack(){
			if(m_state.getPreviousState()){
				changeState(m_state.getPreviousState());
			}else{
				// No previous state i.e. we are in the first state
				dispatchEvent(new BackEvent(this));
			}
		}
		
		public function loadView(viewFactory:IViewFactory):IStateView{
			if(viewFactory!=view.getFactory()){
				container.deleteChild(IUIItem(view));
				return viewFactory.createView(container);
			}else{
				return m_view;
			}
		}
		
		public function getState(void:*):IState{
			return state;
		}
		
		public function performAction(key:String, view:IStateView):void {
			if(key=="back"){
				goBack();
			}else{
				state.performAction(key,view);
			}
		}
		
		public function getModel(void:*):StateModel{
			return m_model;
		}
	}
}