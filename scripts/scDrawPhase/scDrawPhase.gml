if (global.phaseBegin == true){
	//up the turn count
	global.turnCount += 1;
	with (oDeck){
		if (colour = global.turn && hand = noone){
			scDraw(id);
		}
	}
	global.phaseBegin = false;
}

if(mouse_check_button_released(mb_left)){
	if(hoverNextPhase != noone){
		global.phase += 1;
		global.phaseBegin = true;
	}
}
