var list;
var res;
var defined = false;
//if there are no abilities left in the lists open the gamestate
for(i=0;i<3;i+=1){
	if(!is_undefined(ds_list_find_value(global.abList[i],0))){
		defined = true;
	}
}

if(!defined){
	global.gameState = gameStates.active;
}else{
	//if there are abilities find the one at the bottom of the1 highest valued list
	for(var i=2; i>-1; i-=1){
		if(!is_undefined(ds_list_find_value(global.abList[i],0))){
			list = i;
			i = 0;
		}
	}
	global.keyCard = global.keyCardA[list];
	global.keyAbility = global.keyAbilityA[list];
	global.targCard = global.targCardA[list];
	global.resAbility = ds_list_find_value(global.abList[list],0);
	//and resolve it
	with(global.resAbility){
		var test = object_index;
		res = script_execute(global.resAbility.scrR);
	//when the script lets the controller know when its finished delete it from the list
		if(res == true){
			ds_list_delete(global.abList[list],0);
		}
	}
}