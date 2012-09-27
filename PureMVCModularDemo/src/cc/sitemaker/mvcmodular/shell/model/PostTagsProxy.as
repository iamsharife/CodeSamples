package cc.sitemaker.mvcmodular.shell.model
{
	import cc.sitemaker.mvcmodular.shell.model.vo.TagVo;
	
	import mx.collections.ArrayList;
	
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	public class PostTagsProxy extends Proxy
	{	
		public static const NAME:String =  " post Tag Proxy";
		public function PostTagsProxy(data:Object=null)
		{
			super(NAME, data);
			init();
		}
		public var tagsForPost:ArrayList;
		
	
		
		private function init():void{
			tagsForPost = new ArrayList(); 
		}
		
		public function addTag(tag:TagVo):void{
			tagsForPost.addItem(tag);
		}
	
	}
}