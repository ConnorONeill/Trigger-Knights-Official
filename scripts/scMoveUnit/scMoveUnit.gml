//moves a unit on the field to a unoccupied supporting node
//check if there is noone in the units supporting node
var startNode = argument0;
var endNode = argument1;
if (startNode.support == endNode && endNode.occupant == noone && startNode.occupant.moves >= 1){
	//make the occupant of the supporting node the occupant of the selected
    startNode.support.occupant = startNode.occupant;
	//remove the occupant from selected node
    startNode.occupant = noone;
	//give the unit its new location
    startNode.support.occupant.node = startNode.support;
	//move the unit to its new location
    startNode.support.occupant.x = startNode.support.x;
    startNode.support.occupant.y = startNode.support.y;
	//expend a move from the unit
    startNode.support.occupant.moves = startNode.support.occupant.moves - 1;	
}else if (startNode.support == endNode && endNode.occupant != noone && startNode.occupant.moves >= 1 && startNode.support.occupant.moves >= 1){
	//moves a unit if there is another unit	
	//put the units into a local variable
	var startNodeUnit = startNode.occupant;
	var supportNodeUnit = startNode.support.occupant;
	//make the occupant of the nodes swap	
	startNode.support.occupant = startNodeUnit;
	startNode.occupant = supportNodeUnit;
	//give the units its grid location	
	startNode.support.occupant.node = startNode.support;
	startNode.occupant.node = startNode;
	//move the units	
	startNode.support.occupant.x = startNode.support.x;
    startNode.support.occupant.y = startNode.support.y;
	startNode.occupant.x = startNode.x;
    startNode.occupant.y = startNode.y;
	//reduce the moves of the units by 1	
	startNode.support.occupant.moves = startNode.support.occupant.moves - 1;
	startNode.occupant.moves = startNode.occupant.moves - 1;	
}

