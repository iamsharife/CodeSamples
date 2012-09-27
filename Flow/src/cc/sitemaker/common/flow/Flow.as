package cc.sitemaker.common.flow
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.core.IMXMLObject;
	import mx.core.IVisualElement;
	import mx.core.UIComponent;
	import mx.states.State;
	
	import spark.components.Group;
	
	[DefaultProperty("flowStates")]	
	public class Flow extends UIComponent {
				
		private var _flowStates:Vector.<IState>;
		private var _model:*;
		private var _viewContainer:Group;
		private var _currentFlowState:IState;
		
		public function Flow()	{
			super();
			this.visible = this.includeInLayout = false;
		}
				
		[ArrayElementType("cc.sitemaker.common.flow.State")]
		public function get flowStates():Vector.<IState>{
			return _flowStates;
		}

		public function set flowStates(value:Vector.<IState>):void{
			_flowStates = value;
		}

		public function get model():*{
			return _model;
		}

		public function set model(value:*):void{
			_model = value;
		}

		public function get viewContainer():Group{
			return _viewContainer;
		}

		public function set viewContainer(value:Group):void	{
			_viewContainer = value;
			
			trace("viewContainer = " + value);
			if (value)
				setState(currentFlowState);
		}
		
		[Bindable]
		public function set currentFlowState(state:IState):void{
			_currentFlowState = state;
		}
		
		public function get currentFlowState():IState{
			return _currentFlowState;
		}
		
		public function goBack():void{
			if (currentFlowState.previousState){
				changeState(currentFlowState.previousState);
			}
		}
		
		public function changeState(state:IState):void{
			trace("changeState = " + state);
			state.flow = this;
			
			var stateView:IStateView = state.view;
			// Running an action state - use current state's view for its
			// action
			if (state.view == null){
				state.performAction("default", currentFlowState.view);
			}
			else{
				// else normal state load associated view into viewContainer
				
				currentFlowState = state;	
				//for some reason viewContainer.removeAllElements() doesnt seem to work.
				stateView.model = model;
				viewContainer.removeAllElements();
				viewContainer.addElement(stateView);
			}				
		}
		
		public function setState(state:IState):void{
			trace("setState = " + state);
			if (viewContainer == null)
				return;
			
			if (state == null)
				return;
		
			state.previousState = _currentFlowState;				
			changeState(state);
		}
	}
}