//what happened that triggered abilities eg: Card deployed, attack declared etc
var event = argument0;
//the ability that triggered the event, generally used in ability activated calls
var keyAb = argument1;
//the card that is the cause or focus of the event eg: the card that was deployed, the card that declared the attack etc
var keyCrd = argument2
//the target of the ability or event
var targCrd = argument3;
global.I = -1;

global.event = event;

global.gameState = gameStates.collecting;
//collect relevant abilities
var cardId = noone;
var ab = -1;
var i;
//check all lists and find the lowest valued list without a value in it
for(i=0; i<10; i+=1){
	if(is_undefined(ds_list_find_value(global.abList[i],0))){
	//set the highest valued list as the list to use
		var abList = global.abList[i];
		global.keyAbilityA[i] = keyAb;
		global.targCardA[i] = targCrd;
		global.keyCardA[i] = keyCrd;
		global.I = i;
		i = 10;
	}
}
if(keyCrd != noone){
	//get abilities from the keycard
	for(global.prio = 0; global.prio < 2; global.prio += 1){
		with(oAbility){
			if(host == keyCrd){
				if(scrC != noone) ab = script_execute(scrC) else ab = -1;
				if(ab != -1) ds_list_add(abList,id);
			}
		}
	}
	//get abilities from the targ card
	for(global.prio = 0; global.prio < 2; global.prio += 1){
		with(oAbility){
			if(targCrd != noone and host != keyCrd and host == targCrd){
				if(scrC != noone) ab = script_execute(scrC) else ab = -1;
				if(ab != -1) ds_list_add(abList,id);
			}
		}
	}
	
	//get abilities from keycard's allies
	for(global.prio = 0; global.prio < 2; global.prio += 1){
		with(oAbility){
			if(host != keyCrd and host != targCrd and host.colour == keyCrd.colour){
				if(scrC != noone) ab = script_execute(scrC) else ab = -1;
				if(ab != -1) ds_list_add(abList,id);
			}
		}
	}
	//get abilities from keycard's enemies
	for(global.prio = 0; global.prio < 2; global.prio += 1){
		with(oAbility){
			if(host.colour != keyCrd.colour and host != targCrd){
				if(scrC != noone) ab = script_execute(scrC) else ab = -1;
				if(ab != -1) ds_list_add(abList,id);
			}
		}
	}
}
//if there is no keycard eg: end turn/income etc
if(keyCrd == noone){
	//get abilities off cards owned by the turn player
	for(global.prio = 0; global.prio < 2; global.prio += 1){
		with(oAbility){
			if(host.colour == global.turn){
				if(scrC != noone) ab = script_execute(scrC) else ab = -1;
				if(ab != -1) ds_list_add(abList,id);
			}
		}
	}
	//get abilities off cards owned by the opposing player
	for(global.prio = 0; global.prio < 2; global.prio += 1){
		with(oAbility){
			if(host.colour != global.turn){
				if(scrC != noone) ab = script_execute(scrC) else ab = -1;
				if(ab != -1) ds_list_add(abList,id);
			}
		}
	}
	
}
global.gameState = gameStates.resolving;

