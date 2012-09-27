package cc.sitemaker.common.state.interfaces
{
	public interface IStateMachine {
		
		public function setState(state:IState):void;
		
		public function getState(void):IState;
		
		public function performAction(key:String,view:IStateView):void;
		
		public function getModel(void):StateModel;
	}
}