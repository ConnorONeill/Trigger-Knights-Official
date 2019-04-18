deck = argument0;
deck.deckSize = ds_list_size(deck.decklist);
if(deck.deckSize > 0 and deck.hand == noone){
	var cardDrawn = ds_list_find_value(deck.decklist,0);
	deck.hand = cardDrawn;
	if deck.hand.type == types.equip deck.hand.depth -= 1;
	deck.hand.deck = deck;
	deck.hand.colour = deck.colour;
	cardDrawn.x = deck.handX;
	cardDrawn.y = deck.handY;
	deck.hand.position = positions.hand;
	ds_list_delete(deck.decklist,0);
}