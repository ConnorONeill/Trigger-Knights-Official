var card = argument0;
var deck = card.deck;

if card.position == positions.hand card.deck.hand = noone;
if card.position == positions.scry{
	global.player[card.colour].scryCard = noone;
	deck.scry = noone
}
ds_list_insert(deck.decklist,0,card.object_index);
instance_destroy(card);