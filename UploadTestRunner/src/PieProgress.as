package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import mx.core.UIComponent;
	
	import spark.components.Group;
	
	public class PieProgress extends UIComponent {
		
		private var _radius:Number = 50;
		private var _color:uint = 50;
		
		public function PieProgress(){
			super();
			rotation = -90;
		}

		public function get radius():Number {
			return _radius;
		}

		public function set radius(value:Number):void {
			_radius = value;
		}
		
		public function get color():uint {
			return _color;
		}
		
		public function set color(value:uint):void {
			_color = value;
		}

		public function setProgress(bytesLoaded:Number, bytesTotal:Number):void
		{
			var p:Number = bytesLoaded/bytesTotal*100;
			drawPreloader(p);
		}
				
		private function curve(x:Number, y:Number, start:Number, end:Number):void{
			var diff = Math.abs(end -start);
			var divs = Math.floor(diff/(Math.PI/4))+1;
			var span = (diff/(2*divs));
			var rc = _radius/Math.cos(span);
			graphics.moveTo(x+Math.cos(start)*_radius, y+Math.sin(start)*_radius);
			for (var i=0; i<divs; ++i) {
				end = start+span;
				start = end+span;
				graphics.curveTo(
					x+Math.cos(end)*rc,
					y+Math.sin(end)*rc,
					x+Math.cos(start)*_radius,
					y+Math.sin(start)*_radius
				);
			};
		}
		
		private function drawPreloader(e:Number):void{
			var end = 2*Math.PI*e/100;
			graphics.clear();
			
			if (end != 0)
			{
				//graphics.lineStyle(1,0,100);
				graphics.beginFill(_color,100);
				graphics.lineTo(_radius,0);
				
				curve(0, 0, 0, end);
				
				graphics.lineTo(0,0);
				graphics.endFill();
			}
		}
	}
}