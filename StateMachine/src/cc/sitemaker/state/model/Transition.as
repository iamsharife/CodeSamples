package cc.sitemaker.state.model
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	[DefaultProperty("actionlist")]
	public class Transition extends EventDispatcher
	{
		public var on:String;
		public var to:String;
		private var _actionlist:Array;
		
		public function Transition(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function setAction():void{
			
		}

		public function get actionlist():Array
		{
			return _actionlist;
		}

		public function set actionlist(value:Array):void
		{
			_actionlist = value;
		}

	}
}