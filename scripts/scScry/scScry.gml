var deck = argument0;

deck.deckSize = ds_list_size(deck.decklist);

var cardDrawn = ds_list_find_value(deck.decklist,0);
deck.scry = instance_create_depth(deck.handX,deck.handY - sign(deck.handY-100) * cHeight + 5,global.cardDepth,cardDrawn);
deck.scry.deck = deck;
deck.scry.colour = deck.colour;
deck.scry.position = positions.scry;
ds_list_delete(deck.decklist,0);
