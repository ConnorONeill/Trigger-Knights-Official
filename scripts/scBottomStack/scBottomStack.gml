var card = argument0;
var deck = card.deck;

if card.position == positions.hand card.deck.hand = noone;
if card.position == positions.scry{
	global.player[card.colour].scryCard = noone;
	deck.scry = noone
}
//fix this
card.position = positions.deck;
ds_list_add(deck.decklist,card);
