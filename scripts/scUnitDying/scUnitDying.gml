if(dyingStage == 0){
	if(cause == causes.ability){
		scCollect(events.unitDying,global.keyAbilityA[global.I],noone,noone);
	}else{
		with (oCard){
			if(state == cStates.attacking) var cId = id;
		}
		scCollect(events.unitDying,noone,cId,noone);	
	}
	
}else if(dyingStage == 1){
	dyingStage = 0;
	scSendToGrave(id,false);
	dying = false;
}