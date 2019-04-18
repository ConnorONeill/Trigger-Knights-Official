var card = argument0;
var node = argument1;


card.node = node;
card.x = node.x;
card.y = node.y;
node.occupant = card;
card.position = positions.field;  

//card.deck.hand = noone;
//global.player[global.turn].gold = global.player[global.turn].gold - card.cost;