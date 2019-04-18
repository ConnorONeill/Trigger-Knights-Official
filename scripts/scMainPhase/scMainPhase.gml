if(mouse_check_button_pressed(mb_right)){
//Events that happen with selected card
	if(global.selCard != noone){
	//Events with cards in the hand
	    if(global.selCard.position == positions.hand && global.selCard.deck.colour == global.turn){
	    //do a mulligan
	        //if you left click on a card to select it then right click the same card
	        if(global.selCard == global.hoverCard){
	            //if the player has a mulligan left mulligan the card then reduce mul by 1
	            if(global.player[global.turn].mulls>0){
	                scMulligan(global.selCard);
	                global.player[global.turn].mulls -= 1;
	                //when done make sure there is no selected card
	                global.selCard = noone;
	            }else 
	            //else if the player has no mulligan but has an extra draw
	            if(global.player[global.turn].mulls == 0 && global.player[global.turn].exDraw > 0 && global.player[global.turn].gold > 0){
	                scMulligan(global.selCard);
	                //lose the extra draw and 1 gold
	                global.player[global.turn].exDraw = global.player[global.turn].exDraw - 1;
	                global.player[global.turn].gold = global.player[global.turn].gold - 1
	                global.selCard = noone;
					return;
	            }      
	        }
	    //play unit from hand onto field
	        if(global.hoverNode != noone && global.hoverNode.colour == global.turn && global.selCard.type == types.unit && global.hoverNode.occupant == noone && global.player[global.turn].gold - global.selCard.cost >= 0){
				/*scPlaceUnit(global.selCard,global.hoverNode);
				global.selCard.deck.hand = noone; 
				global.player[global.turn].gold = global.player[global.turn].gold - global.selCard.cost;
				global.selCard.position = positions.field;  	
				scCollect(events.postDeploy,noone,global.selCard,noone);
				global.selCard = noone;
				return;*/
	        }   
	    }
	}
	//move unit
	if(global.selNode != noone and global.hoverNode != noone and global.selNode.colour == global.turn){
		//scMoveUnit(global.selNode,global.hoverNode);
	}
	//draw from deck
	if(global.selDeck != noone && global.selDeck == global.hoverDeck && global.selDeck.colour == global.turn && global.player[global.turn].exDraw >= 1 && global.player[global.turn].gold >= 1 && global.selDeck.hand == noone){
        scDraw(global.selDeck);
        global.player[global.turn].gold = global.player[global.turn].gold - 1;
        global.player[global.turn].exDraw -= 1;
    }
}

if(mouse_check_button_released(mb_left)){
	if(hoverEndTurn != noone){
		global.phase = 0;
	}
	/*if(hoverNextPhase != noone){
		global.phase += 1;	
		global.phaseBegin = true;
	}*/

}