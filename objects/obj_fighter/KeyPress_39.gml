/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 457137F3
/// @DnDArgument : "var" "x"
/// @DnDArgument : "op" "1"
/// @DnDArgument : "value" "room_width - sprite_width"
if(x < room_width - sprite_width)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 61048CC6
	/// @DnDParent : 457137F3
	/// @DnDArgument : "x" "sprite_width"
	/// @DnDArgument : "x_relative" "1"
	x += sprite_width;

	/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
	/// @DnDVersion : 1
	/// @DnDHash : 342E5DC5
	/// @DnDParent : 457137F3
	/// @DnDArgument : "obj" "obj_enemy"
	/// @DnDSaveInfo : "obj" "e20abb57-321d-414d-948f-cce3516a544a"
	var l342E5DC5_0 = false;
	l342E5DC5_0 = instance_exists(obj_enemy);
	if(l342E5DC5_0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 429347F8
		/// @DnDParent : 342E5DC5
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "obj_enemy.turn"
		obj_enemy.turn += 1;
	}
}