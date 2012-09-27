package cc.sitemaker.swiz.common.events
{
	import flash.events.Event;
	
	public class ServiceEvent extends Event
	{	
		public static const MOCK:String= "mock";
		public function ServiceEvent(type:String)
		{
			//TODO: implement function
			super(type, true, true);
		}
		
		override public function clone() : Event
		{
			return new ServiceEvent(this.type);
		}
	}
}