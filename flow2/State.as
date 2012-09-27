package cc.sitemaker.common.flow
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.getQualifiedClassName;
	
	import mx.core.ClassFactory;
	import mx.core.IFactory;
	import mx.core.UIComponent;
	
	[DefaultProperty("actions")]
	
	public class State extends EventDispatcher implements IState{
		
		private var _flow:Flow;
		private var _actions:Array;
		private var _view:IStateView;
		private var _viewFactory:*;
		private var _previousState:IState;

		public function State(target:IEventDispatcher=null)	{
			super(target);
		}
		
		public function set flow(value:Flow):void	{
			_flow = value;
		}

		[ArrayElementType("cc.sitemaker.common.flow.IAction")]
		public function set actions(value:Array):void{
			_actions = value;			
		}

		public function get view():IStateView{		
			return _view;
		}

		public function set view(value:*):void	{	
			trace("log: view = "+getQualifiedClassName(value)); 
			var v:Object = new (value as Class)();
			if(v is IStateView){
				_view = v as IStateView;
				_view.addEventListener(ActionEvent.PERFORM, onViewPerformAction);
			}else{
				// throw exception
				throw new Error(getQualifiedClassName(value)+ " must implement IStateView: ");				
			}
			trace("log: at the end");
			
		}

		public function get previousState():IState	{
			return _previousState;
		}

		public function set previousState(value:IState):void{
			_previousState = value;
		}
		
		public function performAction(key:String, view:IStateView = null):void{
			// loop through all actions until we find the one with this key			
			for (var i:int = 0; i<_actions.length; i++){
				var action:Action = (_actions[i] as Action); 
				if (action.actionId == key){
					// listen to action for completion
					action.addEventListener(ActionEvent.COMPLETE, onActionComplete);
					action.perform(_flow.model, view);
					return;
				}
			}
			
			// TODO: For debugging throw an ActionNotFoundException
			throw new Error("No such Action found: "+key);
		}

		private function onViewPerformAction(actionEvent:ActionEvent):void{
			if (actionEvent.actionId == "back"){
				_flow.goBack();	
			}
			else{
				performAction(actionEvent.actionId, _view);
			}
		}
		
		private function onActionComplete(actionEvent:ActionEvent):void{
			var outcome:String = actionEvent.outcome;
			var action:Action = actionEvent.target as Action;
			action.removeEventListener(ActionEvent.COMPLETE, onActionComplete);
						
			// Get transition based on outcome key
			var transition:Transition = action.getTransition(outcome);
			if (transition){
				_flow.setState(transition.to);
			}
		}	
	}
}