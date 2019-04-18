//if player clicks on their deck scry from that deck then stop them from scrying again
if mouse_check_button_released(mb_left) && global.hoverDeck != noone{
	if global.player[global.play].scrying == 0 && global.play = global.hoverDeck.colour{
		scScry(global.hoverDeck);
		global.player[global.hoverDeck.colour].scrying = 1;
		global.player[global.hoverDeck.colour].scryDeck = global.hoverDeck;
	}
}
//if player clicks on a card from the scryed hand bottomstack it, if they have no cards in their hand move the phase along
if (mouse_check_button_released(mb_left) or mouse_check_button_released(mb_right)){
	if(global.hoverCard != noone){
		if global.player[global.play].scrying == 1{
			if (global.hoverCard.type == global.player[global.play].scryDeck.type and global.hoverCard.colour == global.play){
				var deck = global.hoverCard.deck;
				if mouse_check_button_released(mb_left) scBottomStack(global.hoverCard) else scTopStack(global.hoverCard);						
				if(deck.hand == noone && deck.scry != noone){
					deck.hand = deck.scry;
					deck.scry = noone;
					deck.hand.x = deck.handX;
					deck.hand.y = deck.handY;
				}
				if deck.hand == noone global.player[global.play].scrying = 2;
			}
		}
	}
}
if global.player[global.play].scrying == 2 /*and global.player[global.play].opp.scrying == 2*/ global.gameState += 1;