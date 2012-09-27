package cc.sitemaker.utilities.instructions.model
{
	import cc.sitemaker.utilities.instructions.IInstructionTarget;
	import cc.sitemaker.utilities.instructions.model.vo.Instruction;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayList;
	
	public class InstructionProxy {
		
		private var _instructions:ArrayList;
		
		public function InstructionProxy() {
			_instructions = new ArrayList();
		}
		
		public function addInstruction( instruction:Instruction, target:EventDispatcher, eventType:String ) : void{
			if(_instructions.getItemIndex(instruction) == -1){
				_instructions.addItem(instruction);
				target.addEventListener(eventType, onStartupComplete);
			}
		}
		
		protected function onStartupComplete(e:Event):void {
			(e.target as EventDispatcher).removeEventListener(e.type, onStartupComplete);
			var target:IInstructionTarget = e.target as IInstructionTarget;
			var instruction:Instruction = getInstructionByTargetName(target.getTargetName());
			target.routeInstruction(instruction);
			
			_instructions.removeItem(instruction);
		}
		
		protected function getInstructionByTargetName( targetName:String ): Instruction{
			for (var i:int = 0; i < _instructions.length; i++) {
				var instruction:Instruction = _instructions.getItemAt(i) as Instruction;
				if (instruction.targetName == targetName){
					return instruction;
				}
			}
			
			return null;
		}
		
	}
}