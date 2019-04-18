//do normal unit things
if(global.phase == phases.main and global.gameState == gameStates.active and global.turn == global.play and colour == global.play){
	if(global.selCard == id){
		//play unit from hand
		if(global.rightRelease){
			if(position == positions.hand and global.hoverNode.colour == colour and global.hoverNode.occupant == noone and global.player[global.turn].gold - global.selCard.cost >= 0){
				scPlaceUnit(id,global.hoverNode);
				deck.hand = noone; 
				global.player[global.turn].gold = global.player[global.turn].gold - cost;	
				scCollect(events.postDeploy,noone,id,noone);
				global.selCard = noone;	
				return;
			}
			//move unit
			if(global.hoverNode != noone and global.hoverNode.colour == global.turn){
				scMoveUnit(node,global.hoverNode);
				global.selCard = noone;
				return;
			}
			//attack
			if(faceNode != noone and global.hoverNode == faceNode){
				state = cStates.attacking;
				target = global.player[global.opp];
				scCollect(events.attackDeclare,noone,id,global.player[global.opp]);
				global.selCard = noone;
			}else if(unitNode != noone and global.hoverNode == unitNode){
				target = unitNode.occupant;
				state = cStates.attacking;
				scCollect(events.attackDeclare,noone,id,unitNode.occupant);
				global.selCard = noone;
			}
			
			//if(faceNode != noone and global.hoverNode == faceNode){
			//	scAttackFace(id);
			//	faceNode = noone;
			//	global.selCard = noone;
			//}else if(unitNode != noone and global.hoverNode == unitNode){
			//	scAttackUnit(id, unitNode.occupant);
			//	unitNode = noone;
			//	global.selCard = noone;
			//}			
			
		}
	}
}


//if(global.gameState == gameStates.active and dying == true){
//	scUnitDying();
//}

if(global.phase == phases.income and global.turn == global.play and colour == global.play and global.phaseBegin == 1){
	if(position == positions.field){
	    moves = startMoves;
	    attacks = startAttacks;
		turnCount += 1;
	}
}

if(global.gameState == gameStates.active and state == cStates.attacking){	
	if(target.object_index != oPlayer){
			scAttackUnit(id, target);
	}else scAttackFace(id);				
}


	

