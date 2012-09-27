package cc.sitemaker.mvcmodular.shell.model
{
	import cc.sitemaker.mvcmodular.shell.model.vo.TagVo;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.collections.ArrayList;
	
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	public class GlobalTagsProxy extends Proxy
	{	
		public static const NAME:String =  "global Tag Proxy";
		public var tags:ArrayList;
		
		public function GlobalTagsProxy(data:Object=null)
		{
			super(NAME, data);
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
	
		}
		
		public var timer:Timer;
		public function resolve ():void
		{
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimeout);
			timer.start();	
		}
		
		private function onTimeout (e:TimerEvent):void{
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER, onTimeout);
			timer = null;
			delete [timer]
			onResut()
			
		}
		
		private function onResut():void{
			var obj1:TagVo = new TagVo ();
			obj1.name="new Tag 1 from Service";
			
			var obj2:TagVo = new TagVo ();
			obj2.name="new Tag 2 from Service";
			
			var obj3:TagVo = new TagVo ();
			obj3.name="new Tag 3 from Service";
			
			var obj4:TagVo = new TagVo ();
			obj4.name="new Tag 4 from Service";

			tags.removeAll();
			tags.addItem(obj1);
			tags.addItem(obj2);
			tags.addItem(obj3);
			tags.addItem(obj4);
			
			
		}
		
		
	}
}