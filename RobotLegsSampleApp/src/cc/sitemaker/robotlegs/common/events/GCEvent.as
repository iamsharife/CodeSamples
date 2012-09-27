package cc.sitemaker.robotlegs.common.events
{
	import flash.events.Event;
	
	public class GCEvent extends Event
	{
		public static const REMOVE_MODULE:String = "RemoveModule";
		

		
		public function GCEvent(type:String)
		{
			
			super(type, true, true);
		}
		
		override public function clone():Event{
			return new GCEvent(type);
		}
	}
}