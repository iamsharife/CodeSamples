package cc.sitemaker.state.states
{
	import cc.sitemaker.state.interfaces.IState;
	
	[DefaultProperty("transitionlist")]
	public class State implements IState {
		
		public var view:String;
		public var stateMachine:Object;
		
		private var _transitionlist:Array;
		
		public function State() {
		}
		
		public function setPreviousState(state:IState):void{
			
		}	
		
		public function getPreviousState():IState{
			return null;
		}	
		
		public function setViewFactory(state:IState):void{
			
		}			
		
		public function getViewFactory():Object{
			return null;
		}	
		
		public function setAction(action:Object, successState:IState):void{
			
		}		
		
		public function getAction(key:String):Object{
			return null;
		}	
		
		public function performAction(action:Object, view:IState):void{
			
		}			
		
		public function setTransition(action:Object, eventKey:Object, state:IState):void{
			
		}
		
		public function set transitionlist(value:Array):void{
			_transitionlist = value;
		}	

		public function get transitionlist():Array
		{
			return _transitionlist;
		}

		
	}
}