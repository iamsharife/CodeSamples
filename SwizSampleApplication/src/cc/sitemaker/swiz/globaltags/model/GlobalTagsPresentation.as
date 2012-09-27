package cc.sitemaker.swiz.globaltags.model
{
	import cc.sitemaker.swiz.common.model.TagsModel;
	import cc.sitemaker.swiz.common.model.vo.TagVo;
	
	import flash.events.Event;
	import flash.events.MouseEvent;

	[Bindable]
	public class GlobalTagsPresentation
	{
		
		[Inject]
		public var tagModel:TagsModel;
		
		public function GlobalTagsPresentation()
		{
			
		}
		
		public function onAddTag(e:MouseEvent, tagName:String):void
		{
			var tag:TagVo = new TagVo();
			tag.name = tagName;
			tagModel.addTag(tag);
			
		}
	}
}