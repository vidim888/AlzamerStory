if(turn > 3)
{
	if(instance_exists(obj_base))
	{
		if(abs(obj_base.x - x) >= abs(obj_fighter.y - y))
		{
			if(obj_base.x - x > 0)
			{
				x += sprite_width;
			}
		
			else
			{
				x += -sprite_width;
			}
		}
	
		else
		{
			if(obj_base.y - y > 0)
			{
				
				y += sprite_height;
			}
		
			else
			{
				
				y += -sprite_height;
			}
		}
	}

	else
	{
		if(abs(obj_fighter.x - x) >= abs(obj_fighter.y - y))
		{
			if(obj_fighter.x - x > 0)
			{
				x += sprite_width;
			}
		
			else
			{
				x += -sprite_width;
			}
		}
	
		else
		{
			if(obj_fighter.y - y > 0)
			{
				
				y += sprite_height;
			}
		
			else
			{
				
				y += -sprite_height;
			}
		}
	}

	turn = 0;
	
}