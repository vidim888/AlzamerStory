/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 2F4643FA
/// @DnDArgument : "var" "x"
/// @DnDArgument : "op" "2"
/// @DnDArgument : "value" "sprite_width / 2"
if(x > sprite_width / 2)
{
	/// @DnDAction : YoYo Games.Movement.Jump_To_Point
	/// @DnDVersion : 1
	/// @DnDHash : 69103400
	/// @DnDParent : 2F4643FA
	/// @DnDArgument : "x" "-sprite_width"
	/// @DnDArgument : "x_relative" "1"
	x += -sprite_width;

	/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
	/// @DnDVersion : 1
	/// @DnDHash : 06690607
	/// @DnDParent : 2F4643FA
	/// @DnDArgument : "obj" "obj_enemy"
	/// @DnDSaveInfo : "obj" "e20abb57-321d-414d-948f-cce3516a544a"
	var l06690607_0 = false;
	l06690607_0 = instance_exists(obj_enemy);
	if(l06690607_0)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 1F25E679
		/// @DnDParent : 06690607
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "expr_relative" "1"
		/// @DnDArgument : "var" "obj_enemy.turn"
		obj_enemy.turn += 1;
	}
}