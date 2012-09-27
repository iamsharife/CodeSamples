package cc.sitemaker.preload
{
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import mx.core.BitmapAsset;
	
	public class ProgressBar extends MovieClip
	{
		
		[Embed(source="../../../assets/candyStripes.png")]
		private const _candyStripes:Class;

		private const _w:int = 270;
		private const _h:int = 12;
		private const _r:int = 4;
		
		private var _stripesData:BitmapData;
		
		private var _background:Sprite;
		private var _stripes:Sprite;
		private var _stripesBackground:Sprite;
		private var _stripesForeground:Sprite;
		private var _stripesMask:Sprite;
		private var _foreground:Sprite;
		
		private var _t:int;
		
		public function ProgressBar()
		{
			_background = new Sprite();
			_stripes = new Sprite();
			_stripesBackground = new Sprite();
			_stripesForeground = new Sprite();
			_stripesMask = new Sprite();
			_foreground = new Sprite();

			var sD:BitmapAsset = new _candyStripes() as BitmapAsset;
			var oD:BitmapData = sD.bitmapData;
			var oW:int = sD.width;
			var nD:BitmapData = new BitmapData(oW*2, sD.height, true, 0x00000000);
			nD.copyPixels(oD,oD.rect,new Point(0,0));
			nD.copyPixels(oD,oD.rect,new Point(oW,0));
			
			_stripesData = nD;
			
			addChild(_background);
			
			addChild(_stripes);
			
			_stripes.addChild(_stripesBackground);
			_stripes.addChild(_stripesForeground);
			
			addChild(_stripesMask);

			_stripes.mask = _stripesMask;

			addChild(_foreground);
			
			draw();
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function draw():void
		{
			// draw background
			var bG:Graphics = _background.graphics; 
			bG.clear();
			bG.beginFill(0xffffff);
			bG.drawRoundRectComplex(0,0,_w,_h,_r,_r,_r,_r);
			bG.endFill();

			// draw candy stripes
			//background
			var sBG:Graphics = _stripesBackground.graphics;
			sBG.clear();
			sBG.beginFill(0x336699);
			sBG.drawRoundRectComplex(0,0,_w,_h,_r,_r,_r,_r);
			sBG.endFill();
			
			// foreground
			_stripesForeground.alpha = 0.55;
			drawStripes();
			
			drawMask();
			
			// draw foreground
			var m:Matrix = new Matrix();
			m.createGradientBox(_w,_h,Math.PI/2);
			
			var fG:Graphics = _foreground.graphics;
			fG.clear();
			fG.lineStyle(1, 0xB4B4B4, 0, true);
			fG.beginGradientFill(
				GradientType.LINEAR,
				[0,0],
				[0.3,0],
				[0,85],
				m
			);
			fG.drawRoundRectComplex(0,0,_w,_h,_r,_r,_r,_r);
			fG.endFill();
		}
		
		private function drawStripes():void{
			var sFG:Graphics = _stripesForeground.graphics;
			sFG.clear();
			var sM:Matrix = new Matrix();
			sM.tx = _t + (_stripesData.width / 2);
			sFG.beginBitmapFill(_stripesData, sM, true);
			sFG.drawRoundRectComplex(0,0,_w,_h,_r,_r,_r,_r);
			sFG.endFill();
		}
		
		private function drawMask(val:Number=0):void{
			var y:Number = Math.pow(val, 2) / 1;
			var mG:Graphics = _stripesMask.graphics;
			mG.clear();
			mG.beginFill(0);
			var w:int = Math.floor(_w * y);
			mG.drawRect(0,0,w,_h);
			mG.endFill();
		}
		
		private function onEnterFrame(event:Event):void{
			_t++;
			if(_t >= (_stripesData.width/2)){
				_t = 0;
			}
			drawStripes();
		}
		
		public function set progress(val:Number):void{
			trace("~ set progress: ",val);
			drawMask(val);
		}
	}
}