package cc.sitemaker.common.state.interfaces
{
	public interface IState extends IListener{
		
		public function setPreviousState(state:IState):void;
		
		public function getPreviousState(void):IState;
				
		public function setViewFactory(viewFactory:IViewFactory):void;
		
		public function getViewFactory():IViewFactory;
		
		public function setAction(action:IAction, successState:IState):void;
		
		public function getAction(key:String):IAction;
		
		public function performAction(key:String,view:IStateView):void;
		
		public function setTransition(action:IAction, eventKey:Object, state:IState):void;
		
	}
}