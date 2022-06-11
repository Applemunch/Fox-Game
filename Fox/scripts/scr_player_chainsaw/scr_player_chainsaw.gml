function scr_player_chainsaw(){
	rgb = make_color_rgb(255,0,0)
	if vsp < 20
		vsp += grav
	image_speed = 0.35
	switch sprite_index
	{
		case spr_player_chainsawstart:
			hsp = 0
			movespeed = 0
			if floor(image_index) = image_number - 1
			{
				sprite_index = spr_player_chainsawdash
				image_index = 0
				movespeed = 5
			}
			break;
		case spr_player_chainsawdash:
			if floor(image_index) = image_number - 1
				state = 0
			hsp = xscale * movespeed
			if movespeed < 12
				movespeed += 0.5
			if place_meeting(x+xscale,y,obj_solid)
			{
				sprite_index = spr_player_chainsawbump
				vsp = -5.5
			}
			if place_meeting(x,y+1,obj_solid) or place_meeting(x,y+1,obj_slope)
			{
				if k_jump
					vsp = -7
			}
			break;
		case spr_player_chainsawbump:
			hsp = -xscale * movespeed
			if movespeed > 0 and (place_meeting(x,y+1,obj_solid) or place_meeting(x,y+1,obj_slope))
				movespeed -= 1
			if movespeed = 0 or movespeed < 0
			{
				state = 0
				movespeed = 0
			}
			break;
	}
}