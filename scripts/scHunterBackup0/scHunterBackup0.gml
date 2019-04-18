/*if(global.gameState == gameStates.collecting){
	if(global.event == events.attackRaised and global.prio == 1 and position == positions.field){
		return 0
	}else if(global.event == events.defeated and global.prio == 1 and position == positions.field){
		return 1;
	}return -1;		
}
if(global.gameState == gameStates.resolving){
	if(global.resAbility = 0){
		global.resCard.pow += -1;
		scCollect(events.defeated);
		return -1;
	}else if(global.resAbility = 1){
		global.resCard.pow += 5;
		return -1;
	}
}