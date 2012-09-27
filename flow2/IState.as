package cc.sitemaker.common.flow
{
	import flash.display.DisplayObject;

	public interface IState	{
		
		function get view():IStateView;
		function set flow(flow:Flow):void;
		function set previousState(previous:IState):void;
		function get previousState():IState;
		function performAction(key:String, view:IStateView=null):void;
	}
}