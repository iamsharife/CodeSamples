package cc.sitemaker.swiz.common.model
{
	import cc.sitemaker.robotlegs.common.model.vo.TagVo;
	
	import mx.collections.ArrayList;
	import mx.collections.IList;
	
	import org.robotlegs.mvcs.Actor;

	public class PostTagsModel extends Actor
	{		
		public var tagsForPost:ArrayList;
		
		public function PostTagsModel()
		{
			init();
		}
				
		private function init():void{
			tagsForPost = new ArrayList(); 
		}
		
		public function addTag(tag:TagVo):void{
			tagsForPost.addItem(tag);
		}
	}
}