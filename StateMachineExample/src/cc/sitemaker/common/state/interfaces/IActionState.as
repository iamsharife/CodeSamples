package cc.sitemaker.common.state.interfaces
{
	public interface IActionState extends IState {
		
		function setDefaultAction(action:IAction, successState:IState):void;
		
		function setTransitionForDefault(eventKey:String, state:IState):void;
	}
}