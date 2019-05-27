/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 5C9BC0E3
/// @DnDArgument : "var" "y"
/// @DnDArgument : "op" "2"
if(y > 0)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 2896E25B
	/// @DnDParent : 5C9BC0E3
	/// @DnDArgument : "y" "-sprite_height"
	/// @DnDArgument : "y_relative" "1"
	
	y += -sprite_height;

	/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
	/// @DnDVersion : 1
	/// @DnDHash : 6641AA9B
	/// @DnDParent : 5C9BC0E3
	/// @DnDArgument : "obj" "obj_enemy"
	/// @DnDSaveInfo : "obj" "e20abb57-321d-414d-948f-cce3516a544a"
	var l6641AA9B_0 = false;
	l6641AA9B_0 = instance_exists(obj_enemy);
	if(l6641AA9B_0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3708B090
		/// @DnDParent : 6641AA9B
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "obj_enemy.turn"
		obj_enemy.turn += 1;
	}
}