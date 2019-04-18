var attacker = argument0;
var target = argument1;

if(stage == 0){
	attacks -= 1;
	moves -= 1;
	scDealDamage1(target,attacker.pow,0);
	stage += 1;
	return;
}if(stage == 1){
	scDealDamage2(attacker,target);
	stage += 1;
	return;
}if(stage == 2){
	scCollect(events.attacked,noone,attacker,target);
	stage = 0;
	attacker.state = cStates.inactive;
	attacker.target = noone;
	return;
}
//declare attack


