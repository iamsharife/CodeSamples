package cc.sitemaker.swiz.common.model
{
	import cc.sitemaker.swiz.common.model.vo.TagVo;
	
	import mx.collections.ArrayList;

	public class TagsModel 
	{		
		[Bindable]
		public var tags:ArrayList;
		
		//[Inject]public var dispatcher:IModuleEventDispatcher;
		
		public function TagsModel()
		{
			init();
		}
		
		private function init():void{
			tags = new ArrayList();
			
			var tag1:TagVo = new TagVo();
			tag1.name = "Computing";
			tags.addItem(tag1);
			var tag2:TagVo = new TagVo();
			tag2.name = "Moonfruit";
			tags.addItem(tag2);
			var tag3:TagVo = new TagVo();
			tag3.name = "Business";
			tags.addItem(tag3);
			var tag4:TagVo = new TagVo();
			tag4.name = "SiteMaker";
			tags.addItem(tag4);
			var tag5:TagVo = new TagVo();
			tag5.name = "Cooking";
			tags.addItem(tag5);
		
			
		}
		
		public function addTag(tag:TagVo):void{
			tags.addItem(tag);
		}
		
		public function populateFromObject (objects : Array):void{
			
			tags =  new ArrayList ()
			for each (var obj : Object in objects){
				var vo :TagVo =  new TagVo ();
				vo.name = obj.name;
				tags.addItem(vo);
			}
			
			//dispatcher.dispatchEvent(new ModelEvent(ModelEvent.MODEL_PROPERTY_CHANGE, this));
			//dispatch(new ModelEvent(ModelEvent.MODEL_PROPERTY_CHANGE, this));
		}
	}
}