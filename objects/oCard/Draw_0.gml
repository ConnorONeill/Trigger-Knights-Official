/// @description Insert description here
// You can write your code in this editor
if (global.play != colour){
	if (position = positions.hand or position = positions.scry){
		sprite_index = sUnknown;
		image_index = type;
	}
}else sprite_index = sprite;

if(position == positions.hand or position == positions.field){
	draw_self();
}

if (global.hoverCard == id){
		draw_sprite(sprite_index,image_index,room_width-sprite_width-45,room_height/2-(sprite_height+65)/2);
}

/*if(colour != -1 and ds_list_find_index(global.player[colour].grave,0) == id){
		
	
}
