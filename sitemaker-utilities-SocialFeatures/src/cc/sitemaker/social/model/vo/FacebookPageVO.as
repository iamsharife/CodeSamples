package cc.sitemaker.social.model.vo
{
	public class FacebookPageVO {

		public var id:String;
		public var name:String;
		public var category:String;
		public var access_token:String;
	
		public function FacebookPageVO(id:String="", name:String="", category:String="", access_token:String=""){
			this.id = id;
			this.name = name;
			this.category = category;
			this.access_token = access_token;
		}
		
		public function getPageLink():String{
			var link:String = "http://www.facebook.com/pages/"+name+"/"+id;
			link.replace("\s","-");
			return link;
		}
		
		public function getShopTabLink(shopAppId:String):String{
			var link:String = "http://www.facebook.com/pages/"+name+"/"+id+"?sk=app_"+shopAppId;
			link.replace("\s","-");
			return link;
		}
	}
}