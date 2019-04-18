/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
scEquip();
if (host != noone){	
	image_index = 2;
	if(host.equip[0] == id){
		x = host.x;
	}else{
		x = host.x + host.sprite_width - eWidth*.8;
	}
	y = host.y + host.sprite_height - eHeight*.8;
}else image_index = 0;