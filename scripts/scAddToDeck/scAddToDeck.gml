var card = argument0;
var inst = ds_list_add(decklist,instance_create_depth(0,0,global.cardDepth,card));
card.deck = id;
inst.colour = colour;