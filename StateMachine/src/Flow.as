package
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Flow extends EventDispatcher
	{
		public function Flow(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}