/// @description Insert description here
// You can write your code in this editor
colour = -1;
cost = 1;
class[0] = "none";
class[1] = "none";
rarity = -1;
type = -1;
image_xscale = .8;
image_yscale = .8;
sprite = sprite_index;
deck = noone;
var i;
for(i=0;i<5;i+=1){
	ab[i] = noone;
}
targetable = true;
vunerable = true;
position = positions.deck;
node = noone;
turnCount = 0;
state = cStates.inactive;
stage = 0;
played = false;
isCard = true;
objType = objTypes.card;