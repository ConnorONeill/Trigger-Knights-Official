/// @description Insert description here
// You can write your code in this editor
with (oCard){
	if(type == 0){
		if(position = positions.field or position = positions.hand and colour == global.play){
		draw_set_color(c_black);
		draw_text(x+100, y+sprite_height-20,pow);
		draw_text(x+130, y+sprite_height-20,hp);
		draw_set_color(c_white);
		}
	}
}
if(!is_undefined(global.hoverCard) and global.hoverCard != noone) draw_sprite(sSelected,0,global.hoverCard.x,global.hoverCard.y);
if(global.hoverNode != noone) draw_sprite(sSelected,0,global.hoverNode.x,global.hoverNode.y);
if(global.hoverDeck != noone) draw_sprite(sSelected,0,global.hoverDeck.x,global.hoverDeck.y);
if(global.selCard != noone) draw_sprite(sSelected,1,global.selCard.x,global.selCard.y);
if(global.selDeck != noone) draw_sprite(sSelected,1,global.selDeck.x,global.selDeck.y);
var unitN = noone;
var faceN = noone;
with(oCard){
	if(unitNode != noone) unitN = unitNode;
	if(faceNode != noone) faceN = faceNode;
}
if faceN != noone{
	draw_sprite(sSelected,2,faceN.x, faceN.y);	
}else if unitN != noone{
	draw_sprite(sSelected,3,unitN.x, unitN.y);	
}
