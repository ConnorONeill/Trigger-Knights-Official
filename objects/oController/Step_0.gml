/// @description Insert description here
// You can write your code in this editor
global.rightRelease = mouse_check_button_released(mb_right);
global.leftRelease = mouse_check_button_pressed(mb_left);

//check what the mouse is hovering over
global.hoverCard = instance_position(mouse_x,mouse_y,oCard);
global.hoverNode = instance_position(mouse_x,mouse_y,oNode);
global.hoverDeck = instance_position(mouse_x,mouse_y,oDeck);
hoverNextPhase = instance_position(mouse_x,mouse_y,oNextPhase);
hoverEndTurn = instance_position(mouse_x,mouse_y,oEndTurn);
mbLeft = mouse_check_button_released(mb_left);

//check what the player has selected
if(mouse_check_button_released(mb_left)){
	if(global.hoverNode != noone){
		global.selNode = global.hoverNode;
    }
    else{
		global.selNode = noone;
    }
	if(global.hoverCard != noone){
		global.selCard = global.hoverCard;
    }
    else{
		global.selCard = noone;
    }
	if(global.hoverDeck != noone){
		global.selDeck = global.hoverDeck;
    }
    else{
		global.selDeck = noone;
    }
}



if(global.gameState == gameStates.init){
	//randomise starting turn (change later)
		global.turn = global.play; //irandom_range(1,2);
		//draw from all decks
		with oDeck {
			scDraw(id);
		}
		scPlaceUnit(opDeck[0].hand,global.field[1,1]);
		opDeck[0].hand = noone; 
		with oDeck {
			scDraw(id);
		}
		//move to next gamestate
		global.gameState = gameStates.active;
}
if(global.gameState == gameStates.active){	
	switch (global.turn){
		case global.play:
			switch (global.phase){
				case phases.income:
					scIncomePhase();
				break;
					
				case phases.main:
					scMainPhase();
				break;
					
			}
			
		break;			
			
	}


}

/*

if(mouse_check_button_released(mb_left)){
	if(hoverEndTurn != noone){
		scCollect(events.postDeploy,noone,noone,noone);
	}
	if(hoverNextPhase != noone){
		global.phase += 1;	
		global.phaseBegin = true;
	}

}


/*
//check which game state in and allow ht eactions relevant to that gamestate
switch (global.gameState){
	//initialisation
	case gameStates.init:
		//randomise starting turn (change later)
		global.turn = global.play; //irandom_range(1,2);
		//draw from all decks
		with oDeck {
			scDraw(id);
		}
		//move to next gamestate
		global.gameState += 1;
	break;
	
	//if scry state
	case gameStates.scry:
		//scScryPhase();
		global.gameState += 1;
	break;
	
	case gameStates.active:
		switch (global.turn){
			case global.play:
				switch (global.phase){
					case phases.income:
						scIncomePhase();
					break;
					
					case phases.main:
						scMainPhase();
					break;
					
				}
			
			break;			
			
		}
		
	break;
	
	case gameStates.resolving:
		scResolve();
	break;
	
}
*/