package cc.sitemaker.domains.register.actions
{
	import cc.sitemaker.common.flow.Action;
	import cc.sitemaker.common.flow.ActionEvent;
	import cc.sitemaker.common.flow.IStateView;
	import cc.sitemaker.common.flow.StateProperties;
	import cc.sitemaker.common.flow.StateProperty;
	import cc.sitemaker.domains.util.DomainNameFormatter;
	
	import mx.collections.ArrayList;
	import mx.utils.ObjectUtil;
	
	public class SearchDomainAction extends Action {
		
		private var _availableDomains:ArrayList;
		private var _unavailableDomains:ArrayList;
		private var _searchList:ArrayList;
		private var _invalidDomains:ArrayList;
		
		public function SearchDomainAction(){
			super();
		}
		
		override public function perform(model:*, view:IStateView):void{
			trace("perform = " + view);
			_view = view;
			var properties:Vector.<StateProperty> = _view.stateProperties;
			var domain:StateProperty = StateProperty.GetProperty(properties, "domains");
			var extensions:StateProperty = StateProperty.GetProperty(properties, "extensions");
			
			trace("domain = "+domain.getValue());
			
			
			var e:Array = extensions.getValue();
			

			super.perform(model, view);
			
					
		/*	_availableDomains = new ArrayList();
			_unavailableDomains = new ArrayList();
			_searchList = new ArrayList();
			
			
			
			
			// get domains from list
			var domainsText:String = domain.getValue() as String;
			
			// seperate each domain on new line into array
			var d:ArrayList = new ArrayList(domainsText.split('\r'));
			var domains:ArrayList = new ArrayList();
			
			// Ignore any blank lines and remove duplicates
			for (var i:Number = 0;i < d.length; i++){
				if ((d[i] != "") && (d[i] != " ") && (!containsDomain(d[i],domains))) {
					domains.addItem(d[i]);
				var dItem:String = d.getItemAt(i) as String;
				if ((dItem != "") && (dItem != " ") && (!containsDomain(dItem,domains))) {
					domains.addItem(dItem);
				}	
			}		
			
			// do some error checking on domains list
			if ((domains.length == 0) || (domainsText.length == 0)) {
				domain.error = "You must enter at least one domain";
				return;
			}
			
			// Check for more than the maximum of 50 domain names
			if (domains.length > 50) {
				domain.error = "You have exceeded the number of domains you may search at one time.";
				return;
			}
			
			// Format domains
			for (var i:Number = 0;i < domains.length; i++) {		
				var str:String = domains.getItemAt(i) as String;
				str = DomainNameFormatter.Format(str);
			}
			
			super.perform(view);
			/*
			// Validate domains
			_invalidDomains = new ArrayList();
			for (var i:Number = 0;i < domains.length; i++) {
				// Get validation error from Validation and resolve textbundle key from it
				var domainError:DomainNameValidationError = DomainNameValidator.Validate(domains[i],true);
				
				// Remove invalid domains from this list and add to a seperate list
				if (domainError != null) {
					m_invalidDomains.push(domains[i]);
					domains.splice(i, 1);
					i--;
				}
			}*/
		}
		
		private function containsDomain(domain:String, list:ArrayList):Boolean{			
			for (var i:int = 0; i < list.length; i++) {
				var listDomain:String = list[i] as String;
				if (listDomain == domain)
					return true;
			}
			
			return false;			
		}
		
		override protected function onResult(result:Object):void{
			super.onResult(result);	
		}
	}
}