package cc.sitemaker.robotlegs.common.model.services
{
	import cc.sitemaker.robotlegs.common.events.ServiceEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class TagsResolverService extends EventDispatcher
	{	
		
		private var service : MockTagsLoader; 
		public static const RESOLVED:String = "resolved";
		public function TagsResolverService()
		{
			super();
			service =  new MockTagsLoader ();
		}
		
		public var timer:Timer;
		
		public function resolve ():void
		{
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimeout);
			timer.start();	
		}
		
		private function onTimeout (e:TimerEvent):void{
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER, onTimeout);
			timer = null;
			delete [timer];
			var resultArray :Array = getMocks ();
			dispatchEvent(new ResultEvent (ResultEvent.RESULT,false, true,resultArray))
			
		}
		
		private function getMocks():Array{
			var obj1:Object = {name : "Computer"}
			var obj2:Object = {name : "AS3"}
			var obj3:Object = {name : "Flex"}
			var obj4:Object = {name : "Robotlegs"}
			
			return  [obj1,obj2,obj3,obj4]	
		}
		
		
	}
}