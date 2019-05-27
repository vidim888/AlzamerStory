/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0809E68D
/// @DnDArgument : "var" "y"
/// @DnDArgument : "op" "1"
/// @DnDArgument : "value" "room_height - sprite_height"
if(y < room_height - sprite_height)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 39830395
	/// @DnDParent : 0809E68D
	/// @DnDArgument : "y" "sprite_height"
	/// @DnDArgument : "y_relative" "1"
	
	y += sprite_height;

	/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
	/// @DnDVersion : 1
	/// @DnDHash : 678B2562
	/// @DnDParent : 0809E68D
	/// @DnDArgument : "obj" "obj_enemy"
	/// @DnDSaveInfo : "obj" "e20abb57-321d-414d-948f-cce3516a544a"
	var l678B2562_0 = false;
	l678B2562_0 = instance_exists(obj_enemy);
	if(l678B2562_0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 7D6FC983
		/// @DnDParent : 678B2562
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "obj_enemy.turn"
		obj_enemy.turn += 1;
	}
}