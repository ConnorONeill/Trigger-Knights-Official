if(global.phase == phases.main and global.gameState == gameStates.active and global.turn == global.play and colour == global.play){
	if(global.selCard == id){
		if(position == positions.field and attacks > 0){
			if(range == ranges.melee and node.gridY == 0){
				if(global.field[node.actualX, node.actualY - 1].occupant != noone){
					unitNode = global.field[node.actualX, node.actualY - 1];
				}else{
					faceNode = global.field[node.actualX, node.actualY - 1];
				}
			}else if(range == ranges.ranged and node.gridY == 0){
				if(global.field[node.actualX, node.actualY - 2].occupant != noone){
					unitNode = global.field[node.actualX, node.actualY - 2];
				}else{
					faceNode = global.field[node.actualX, node.actualY - 2];
				}
			}else if(range == ranges.ranged and node.gridY == 1 and global.field[node.actualX, node.actualY - 2].occupant != noone){
				unitNode = global.field[node.actualX, node.actualY - 2];
			}else faceNode = noone;
		}
	}else{
		unitNode = noone;
		faceNode = noone;
	}
}