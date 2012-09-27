package cc.sitemaker.swiz.posttags.model
{
	import cc.sitemaker.swiz.common.model.TagsModel;
	
	[Bindable]
	public class PostTagsPresentation
	{		
		[Inject]
		public var tagModel:TagsModel;
		
		public function PostTagsPresentation()
		{
			
		}
	}
}