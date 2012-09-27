package cc.sitemaker.toolbar
{
	import cc.sitemaker.preload.ProgressBar;
	
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	
	public class SubAppLoadingBar extends UIComponent
	{
		
		private var _progressBar:ProgressBar;
		
		public function SubAppLoadingBar()
		{
			super();
			
			_progressBar = new ProgressBar();
			addChild(_progressBar);
			
			explicitWidth = _progressBar.width;
			explicitHeight = _progressBar.height;
		}
		
		public function setProgress(bytesLoaded:Number, bytesTotal:Number):void{
			_progressBar.progress = bytesLoaded / bytesTotal;
		}
	}
}