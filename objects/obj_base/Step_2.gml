/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 76B1EE9F
/// @DnDArgument : "obj" "obj_enemy"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "obj" "e20abb57-321d-414d-948f-cce3516a544a"
var l76B1EE9F_0 = false;
l76B1EE9F_0 = instance_exists(obj_enemy);
if(!l76B1EE9F_0)
{
	/// @DnDAction : YoYo Games.Game.Restart_Game
	/// @DnDVersion : 1
	/// @DnDHash : 59D973C9
	/// @DnDParent : 76B1EE9F
	game_restart();
}