package cc.sitemaker.swiz.model.presentation
{
	import flash.events.IEventDispatcher;

	public class MyPresentationModel
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Bindable]
		public var myLabelText:String = "HelloWorld";
		
		public function MyPresentationModel()
		{
			
		}
		
		public function changeText(text:String):void{
			myLabelText = text;
		}
	}
}