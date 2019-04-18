if(global.play == global.turn and global.phase == phases.main and global.selCard == id and global.play == colour and position = positions.hand){
	if(mouse_check_button_pressed(mb_right) and global.hoverCard.type == types.unit and global.hoverCard.position == positions.field){
		if(rangeRestriction == -1 or global.hoverCard.range == rangeRestriction){
			if(restriction[0] != ""){
				if(multiRestr == true){
					if(restriction[0] == global.hoverCard.class[0] or restriction[0] == global.hoverCard.class[1]){
						if(restriction[1] == global.hoverCard.class[0] or restriction[1] == global.hovercard.class[1]){
							if(global.hoverCard.equip[0] == noone){
								//equip the card
								scEquipFinish();
							}else if(global.hoverCard.equip[1] == noone){
								//equip the card
								scEquipFinish();
							}
						}
					}
						
				}else{
					if(restriction[0] == global.hoverCard.class[0] or restriction[1] == global.hoverCard.class[0] or restriction[0] == global.hoverCard.class[1] or restriction[1] == global.hoverCard.class[1]){
						if(global.hoverCard.equip[0] == noone){
							//equip the card
							scEquipFinish();
						}else if(global.hoverCard.equip[1] == noone){
							//equip the card
							scEquipFinish();
						}
					}
						
				}
			}else{
				if(global.hoverCard.equip[0] == noone){
				//equip the card
				scEquipFinish();
				}else if(global.hoverCard.equip[1] == noone){
				//equip the card
				scEquipFinish();
				}
			}		
		}
	}
}