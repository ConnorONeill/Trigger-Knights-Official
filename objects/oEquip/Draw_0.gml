/// @description Insert description here
// You can write your code in this editor
draw_self();
if (global.hoverCard == id){
	if(host == noone){	
			draw_sprite(sprite_index,image_index,room_width-sprite_width-45,room_height/2-(sprite_height+65)/2);
	}else{
		draw_sprite(sprite_index,0,room_width-sprite_width-45,room_height/2-(sprite_height+65)/2);
	}
}
