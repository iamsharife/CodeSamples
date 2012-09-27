package cc.sitemaker.state.interfaces
{
	public interface IState
	{
		function setPreviousState(state:IState):void;		
		
		function getPreviousState():IState;
		
		function setViewFactory(state:IState):void;		
		
		function getViewFactory():Object;
		
		function setAction(action:Object, successState:IState):void;		
		
		function getAction(key:String):Object;
		
		function performAction(action:Object, view:IState):void;		
		
		function setTransition(action:Object, eventKey:Object, state:IState):void;
	}
}