package cc.sitemaker.robotlegs.blog.view.mediator
{
	import cc.sitemaker.robotlegs.blog.view.components.BlogMain;
	import cc.sitemaker.robotlegs.common.model.DataModel;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class BlogMainMediator extends Mediator
	{
		[Inject]public var blogMain:BlogMain;
		
		[Inject]public var model:DataModel;
		
		public function BlogMainMediator()
		{
			super();
		}
		
		override public function onRegister():void{
			blogMain.lbl.text = "BlogMain " + model.data.toString();
		}
	}
}