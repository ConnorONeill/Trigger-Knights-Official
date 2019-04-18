//use in tandem with scDealDamFin
var target = argument0;
var damage = argument1;
var iCause = argument2;

if(damage > target.damRes){
	target.hp -= damage - target.damRes;
	if(target.hp <= 0){
		target.dying = true;
		target.cause = iCause;
		scCollect(events.unitDying,noone,id,target);		
	}
}

//check if target dead
//if target not dead perform damage taken effs