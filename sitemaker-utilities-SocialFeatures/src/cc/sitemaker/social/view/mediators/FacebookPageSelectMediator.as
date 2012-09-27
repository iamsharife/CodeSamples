package cc.sitemaker.social.view.mediators
{
	import cc.sitemaker.social.event.FacebookViewEvent;
	import cc.sitemaker.social.model.SocialModel;
	import cc.sitemaker.social.model.vo.FacebookPageVO;
	import cc.sitemaker.social.view.components.FacebookPageSelect;
	import cc.sitemaker.social.view.components.facebookpageselect.FacebookPageItemRenderer;
	
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.collections.ArrayList;
	import mx.events.CloseEvent;
	import mx.events.ItemClickEvent;
	import mx.utils.ObjectUtil;
	
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	import spark.events.RendererExistenceEvent;
	
	public class FacebookPageSelectMediator extends ModuleMediator {
		
		[Inject]
		public var view:FacebookPageSelect;
		
		[Inject]
		public var model:SocialModel;
		
		private var _selectedPageId:String;
		
		override public function onRegister():void{
			addContextListener(FacebookViewEvent.CLOSE_PAGES_PANEL, onClosePagesPanel);
			
			eventMap.mapListener(view.pageList, RendererExistenceEvent.RENDERER_ADD, onPageRendererAdd);
			eventMap.mapListener(view.btnCreateFBPage, MouseEvent.CLICK, onCreateFBPageClick);
			eventMap.mapListener(view.btnCreateFBPage2, MouseEvent.CLICK, onCreateFBPageClick);
			eventMap.mapListener(view.btnOk, MouseEvent.CLICK, onOkClick);
			eventMap.mapListener(view.btnCancel, MouseEvent.CLICK, onCancelClick);
			eventMap.mapListener(view.btnYes, MouseEvent.CLICK, onYesClick); 
			eventMap.mapListener(view.btnNo, MouseEvent.CLICK, onNoClick);

			addViewListener(FacebookViewEvent.SELECT_PAGE_IN_UI, onSelectPageInUi);
			
			view.pageList.dataProvider = new ArrayList(model.fbPages);
			if (model.fbPages.length > 0){
				// set a default for time being
				if (view.currentPageId != null && view.currentPageId != ""){
					view.pagesGroup.selectedValue = model.getFacebookPageVOById(view.currentPageId).name;
				} else {
					view.pagesGroup.selectedValue = (model.fbPages[0] as FacebookPageVO).name;
					_selectedPageId = (model.fbPages[0] as FacebookPageVO).id;
				}
			} else {
				view.currentState = "hasNoPages";
			}
		}
		
		private function onClosePagesPanel(e:FacebookViewEvent):void {
			close();			
		}
		
		private function onPageRendererAdd(e:RendererExistenceEvent):void{
			(e.renderer as FacebookPageItemRenderer).pagesGroup = view.pagesGroup;
		}
		
		private function onCreateFBPageClick(e:MouseEvent):void{
			var request:URLRequest = new URLRequest("http://www.facebook.com/pages/create.php");
			navigateToURL(request,"_blank");
			close();
		}
		
		private function onOkClick(e:MouseEvent):void{
			if (view.currentPageId == null || view.currentPageId == ""){
				proceed();
			} else {
				view.currentState = "warning";
			}
		}
		
		private function proceed():void{
			var fve:FacebookViewEvent = new FacebookViewEvent(FacebookViewEvent.SELECT_PAGE);
			fve.pageId = _selectedPageId;

			dispatch(fve);
			dispatchToModules(fve);
		}
		
		private function onCancelClick(e:MouseEvent):void{
			close();
		}

		private function onYesClick(e:MouseEvent):void{
			proceed();
		}
		
		private function onNoClick(e:MouseEvent):void{
			view.currentState = "base";
		}
		
		private function close():void{
			view.dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
		}
		
		private function onSelectPageInUi(e:FacebookViewEvent):void{
			_selectedPageId = e.pageId;
		}
	}
}