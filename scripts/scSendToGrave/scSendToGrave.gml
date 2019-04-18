//change unit position, add to ds_list, trigger send ability

var card = argument0;
var collect = argument1;
if (card.position == positions.field){
	card.node.occupant = noone;
	card.node = noone;
}else if(card.position == positions.hand){
	card.deck.hand = noone;
}
card.dying = false;

card.position = positions.grave;
ds_list_add(global.player[card.colour].grave.list,card);
if(collect == true){
	scCollect(events.sentGrave,noone,card,noone);
}