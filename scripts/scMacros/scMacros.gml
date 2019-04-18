enum abTypes{
	passive,
	active,
	reactive
}
enum colours{
	blue,
	red
}
enum positions{
	deck,
	hand,
	field,
	grave,
	exile,
	scry
}
enum types{
	unit,
	equip,
	spell,
	relic
}

enum rarities{
	basic,
	normal,
	legendary
}

enum phases{
	income,
	main,
	endp
}

enum gameStates{
	init,
	scry,
	active,
	complete,
	collecting,
	resolving
}

enum ranges{
	melee,
	ranged
	
}

enum events{
	turnStart,
	turnEnd,
	preDeploy,
	postDeploy,
	equip,
	spell,
	defeated,
	destroyed,
	attackRaised,
	attackDeclare,
	sentGrave,
	damDealt,
	attacked,
	unitDying	
}

enum abStates{
	open,
	collecting,
	resolving
}
enum cStates{
	inactive,
	attacking,
	deploying
	
}
enum aTypes{
	passive,
	active,
	reactive
}
enum causes{
	battle,
	ability
}
enum objTypes{
	card,
	player,
	ability,
	deck
}
#macro cWidth 180
#macro cHeight 260
#macro eWidth 84
#macro eHeight 73