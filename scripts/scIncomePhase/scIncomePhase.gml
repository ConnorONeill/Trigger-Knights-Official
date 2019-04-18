if (global.phaseBegin == 0){
	//add gold mul and extra draw to player
		global.turnCount += 1;
	scCollect(events.turnStart,noone,noone,noone);
	global.phaseBegin += 1;
}else if(global.phaseBegin == 1){
	with (oDeck){
		if (colour = global.play && hand = noone){
			scDraw(id);
		}
	}
	global.player[global.play].gold += global.goldIncome;
	global.player[global.play].mulls = 2;
	global.player[global.play].exDraw = 1;
	//add moves and attacks to units on the field
	with(oCard){
	    if(position == positions.field and type = 0){
	    moves = startMoves;
	    attacks = startAttacks;
	    }
	}
	global.phaseBegin += 1;
}else if(global.phaseBegin == 2){
	global.phase += 1;
	global.phaseBegin = 0;
}
	



