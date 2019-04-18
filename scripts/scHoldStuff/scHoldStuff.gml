//moves a unit on the field to a unoccupied supporting node
//check if there is noone in the units supporting node
var selNode = global.selNode;
var hoverNode = global.hoverNode
if (selNode.support == hoverNode && hoverNode.occupant == noone && selNode.occupant.moves >= 1){
	//make the occupant of the supporting node the occupant of the selected
    selNode.support.occupant = selNode.occupant;
	//remove the occupant from selected node
    selNode.occupant = noone;
	//give the unit its new location
    selNode.occupant.node = selNode;
	//move the unit to its new location
    selNode.support.occupant.x = selNode.support.x;
    selNode.support.occupant.y = selNode.support.y;
	//expend a move from the unit
    selNode.support.occupant.moves = selNode.support.occupant.moves - 1;	
}else if (selNode.support == hoverNode && hoverNode.occupant != noone && selNode.occupant.moves >= 1 && selNode.support.occupant.moves >= 1){
	//moves a unit if there is another unit	
	//put the units into a local variable
	selNodeUnit = selNode.occupant;
	supportNodeUnit = selNode.support.occupant;
	//make the occupant of the nodes swap	
	selNode.support.occupant = selNodeUnit;
	selNode.occupant = supportNodeUnit;
	//give the units its grid location	
	selNode.support.occupant.node = selNode.support;
	selNode.occupant.node = selNode;
	//move the units	
	selNode.support.occupant.x = selNode.support.x;
    selNode.support.occupant.y = selNode.support.y;
	selNode.occupant.x = selNode.x;
    selNode.occupant.y = selNode.y;
	//reduce the moves of the units by 1	
	selNode.support.occupant.moves = selNode.support.occupant.moves - 1;
	selNode.occupant.moves = selNode.occupant.moves - 1;	
}

