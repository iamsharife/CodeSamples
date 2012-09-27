package cc.sitemaker.common.flow
{
	import flash.events.IEventDispatcher;
	
	import mx.core.IVisualElement;
	import mx.managers.CursorManager;

	public interface IStateView	extends IVisualElement{
		
		function get stateProperties():Vector.<StateProperty>;
		function set stateProperties(value:Vector.<StateProperty>):void;
		function set model(value:*):void;
		function block():void;
		function unblock():void;
	}
}