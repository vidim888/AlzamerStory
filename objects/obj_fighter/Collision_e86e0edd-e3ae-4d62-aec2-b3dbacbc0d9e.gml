/// @DnDAction : YoYo Games.Rooms.If_First_Room
/// @DnDVersion : 1
/// @DnDHash : 1D67A364
if(room == room_first)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 4222311E
	/// @DnDApplyTo : other
	/// @DnDParent : 1D67A364
	with(other) instance_destroy();

	/// @DnDAction : YoYo Games.Rooms.Next_Room
	/// @DnDVersion : 1
	/// @DnDHash : 0AB3A987
	/// @DnDParent : 1D67A364
	room_goto_next();
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 47F4858F
else
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 7285970B
	/// @DnDApplyTo : other
	/// @DnDParent : 47F4858F
	with(other) instance_destroy();
}