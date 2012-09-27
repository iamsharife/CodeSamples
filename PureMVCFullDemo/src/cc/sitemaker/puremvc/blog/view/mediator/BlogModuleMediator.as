package cc.sitemaker.puremvc.blog.view.mediator
{
	import modules.Blog;
	
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class BlogModuleMediator extends Mediator
	{		
		public static const NAME:String = "BlogModuleMediator";

		public function BlogModuleMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		/**
		 * The viewComponent cast to type HelloModule.
		 */
		private function get blogModule():Blog
		{
			return viewComponent as Blog;
		}

		override public function onRegister():void{
			blogModule.lbl.text += " blogMediator";
		}
	}
}