package cc.sitemaker.utilities.instructions
{
	import cc.sitemaker.utilities.instructions.model.vo.Instruction;

	public interface IInstructionTarget
	{
		function getTargetName():String;
		function routeInstruction(instruction:Instruction):void;
	}
}