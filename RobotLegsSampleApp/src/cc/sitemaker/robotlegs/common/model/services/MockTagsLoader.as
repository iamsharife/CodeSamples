package cc.sitemaker.robotlegs.common.model.services
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class MockTagsLoader extends EventDispatcher
	{	
		public static const DATA_RESOLVED : String =  "data has been resolved";
		public function MockTagsLoader(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}