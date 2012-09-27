package cc.sitemaker.robotlegs.common.events
{
	import flash.events.Event;
	
	public class ModelEvent extends Event
	{
		public static const MODEL_PROPERTY_CHANGE:String = "modelPropertyChange";
		
		public var model:Object;
		
		public function ModelEvent(type:String,model:Object)
		{
			this.model = model;
			super(type, true, true);
		}
		
		override public function clone():Event{
			return new ModelEvent(type, model);
		}
	}
}