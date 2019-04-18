host = global.hoverCard;
if(global.hoverCard.equip[0] == noone){
	//equip the card
	global.hoverCard.equip[0] = id;
	x = host.x;
}else if(global.hoverCard.equip[1] == noone){
	//equip the card
	global.hoverCard.equip[1] = id;
	x = host.x + host.sprite_width - eWidth;
}
position = positions.field;
deck.hand = noone;
y = host.y + host.sprite_height - eHeight*.8;
with oCard event_user(0);
