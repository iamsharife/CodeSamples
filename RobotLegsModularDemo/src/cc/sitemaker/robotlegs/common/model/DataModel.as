package cc.sitemaker.robotlegs.common.model
{
	import org.robotlegs.utilities.modular.mvcs.ModuleActor;

	public class DataModel extends ModuleActor
	{		
		private var _data:Object;
		
		public function DataModel()
		{
			init();
		}
		
		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}
		
		private function init():void{
			data = "HelloWorld!";
		}
	}
}