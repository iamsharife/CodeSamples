package cc.sitemaker.common.state.interfaces
{
	public interface IDispatcher
	{

		function addListener(eventType:Number, listener:IListener):void;
		
		function removeListener(eventType:Number, listener:IListener):void;
		
		function dispatchEvent(event:Event):void;
	}
}