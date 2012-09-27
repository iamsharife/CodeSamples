package cc.sitemaker.common.components
{
	import mx.collections.ArrayList;
	import mx.collections.IList;
	
	import spark.components.HGroup;
	import spark.components.SkinnableContainer;
	import spark.layouts.HorizontalLayout;
	
	public class Stepper extends SkinnableContainer {
		
		private var _dataProvider:Object;
		
		private var _selectedIndex:int;
		
		public function Stepper() {
			super();
			var hLayout:HorizontalLayout = new HorizontalLayout();
			hLayout.gap = -6;
			layout =hLayout;
		}		
		
		public function get dataProvider():Object {
			return _dataProvider;
		}

		public function set dataProvider(value:Object):void {
			_dataProvider = value;
					
			if (value is Array){
				for (var i:int = 0; i < value.length; i++) {
						var data:Object = value[i] as Object;						
						var stepperStep:StepperStep = new StepperStep;
						stepperStep.label = data.label;
						stepperStep.index = i;
						this.addElement(stepperStep);
				}
			}
		}

		public function get selectedIndex():int {
			return _selectedIndex;
		}

		public function set selectedIndex(value:int):void 	{
			_selectedIndex = value;
			
			setStates();
		}
		
		private function setStates():void{			
			for (var i:int = 0; i < this.numElements; i++) {
				var stepperStep:StepperStep = this.getElementAt(i) as StepperStep;
				
				if (i < selectedIndex)
					stepperStep.currentState = "done";
				else if ( i == selectedIndex ) 
					stepperStep.currentState = "inprogress";
				else
					stepperStep.currentState = "normal";
			}			
		}
		

	}
}