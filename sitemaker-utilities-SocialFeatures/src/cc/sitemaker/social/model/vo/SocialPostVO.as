package cc.sitemaker.social.model.vo
{
	import com.adobe.serialization.json.JSON;
	
	import mx.utils.ObjectUtil;
	
	public class SocialPostVO {
		
		public var title:String;
		public var imageUrl:String;
		public var titleUrl:String;
		public var message:String;
		public var description:String;
		public var caption:String;
		public var actions:Object;
		
		public function toFacebookObject():Object{
			var params:Object = {};
			params.name = title;
			params.message = message;
			params.link = titleUrl;
			params.picture = imageUrl;
			params.description = description;
			params.caption = caption;
			var myactions:String=JSON.encode(actions);
			params.actions = myactions;
			//			params.actions = JSON.encode(actions);
			
			params = removeNullProperties(params);
			trace("SocialPostVO:",ObjectUtil.toString(params));
			
			return params;
		}
		
		public function toTwitterObject():Object{
			return {};
		}
		
		private function removeNullProperties(obj:Object):Object{
			
			var classInfoProperties:Array = ObjectUtil.getClassInfo(obj).properties as Array;
			
			for each(var p:String in classInfoProperties){
				var val:* = obj[p];
				
				if (val is Array){
					var array:Array = val as Array;
					
					if (array.length == 0){
						delete obj[p];
					}
				} else if ((val is String && (val == "" || val == "null")) || val == null){
					delete obj[p];
				}
			}
			
			return obj;
		}
		private function removeNullPropertiesOld(obj:Object):Object{
			for each (var i:String in obj){
				if (obj[i] == null 
					|| (obj[i] is String && obj[i] == "")
					|| (obj[i] is Array && (obj[i] as Array).length == 0)){
					delete obj[i];
				}
			}
			
			return obj;
		}
	}
}