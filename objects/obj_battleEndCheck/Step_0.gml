/// @DnDAction : YoYo Games.Instances.If_Instance_Exists
/// @DnDVersion : 1
/// @DnDHash : 73EC9F19
/// @DnDArgument : "obj" "obj_enemy"
/// @DnDArgument : "not" "1"
/// @DnDSaveInfo : "obj" "e20abb57-321d-414d-948f-cce3516a544a"
var l73EC9F19_0 = false;
l73EC9F19_0 = instance_exists(obj_enemy);
if(!l73EC9F19_0)
{
	/// @DnDAction : YoYo Games.Rooms.Previous_Room
	/// @DnDVersion : 1
	/// @DnDHash : 111A0ECF
	/// @DnDParent : 73EC9F19
	room_goto_previous();
}