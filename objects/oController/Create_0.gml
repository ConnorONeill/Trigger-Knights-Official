/// @description Where the magic begins
// You can write your code in this editor

//Set Enums and macros


//for events/abilities and stuff
global.keyAbility = noone;
global.keyCard = noone;
global.targCard = noone;

for(i=0; i<10; i+=1){
	global.keyAbilityA[i] = noone;
	global.targCardA[i] = noone;
	global.keyCardA[i] = noone;
	global.abList[i] = ds_list_create();
}


//set depths
global.cardDepth = -20;
global.deckDepth = -10;
global.statDepth = -30;

//set states
global.gameState = gameStates.init;
global.phase = phases.income;
global.turn = -1;
global.phaseBegin = 0;

//set income
global.goldIncome = 2;

//set turn count
global.turnCount = 0


hand1X = (cWidth*6)+20;
graveX = (cWidth*4);

//set fonts
font[1] = fBrian12;
font[2] = fBrian14;
font[3] = fBrian18;

draw_set_font(font[2]);

//set the winner variable
winner = noone;

//create a random seed
randomize();

//create the health object
instance_create_depth(0,0,global.statDepth,oHealth);
	
//create the players
global.player[colours.red] = instance_create_depth(0,0,-30,oPlayer);
global.player[colours.blue] = instance_create_depth(0,0,-30,oPlayer);
global.player[colours.red].colour = colours.red;
global.player[colours.red].opp = global.player[colours.blue];
global.player[colours.blue].colour = colours.blue;
global.player[colours.blue].opp = global.player[colours.red];
global.play = irandom_range(0,1);
if global.play = 1 global.opp = 0 else global.opp = 1;
global.player[global.play].grave = instance_create_depth(graveX,cHeight*2,-10,oGrave);
global.player[global.opp].grave = instance_create_depth(graveX+cWidth,cHeight*2,-10,oGrave);
global.player[global.opp].grave.image_angle = 180;

//Create the field (3x2 of blue and 3x2 of red under the blue) and place them in a 2d array
//if play 0 draw blue side up and if play = 1 draw red side up

for(xSpot = 0; xSpot < 3; xSpot += 1){
    for(ySpot = 0; ySpot <= 1; ySpot += 1){
        global.field[xSpot, ySpot] = instance_create_depth(xSpot*(cWidth), ySpot*(cHeight),-5, oNode);
		if(global.play == 0){
			global.field[xSpot, ySpot].gridX = xSpot;
		}else{
			global.field[xSpot, ySpot].gridX = 2 - xSpot;
		}
		global.field[xSpot, ySpot].gridY = 1 - ySpot;
		global.field[xSpot, ySpot].actualX = xSpot;
		global.field[xSpot, ySpot].actualY = ySpot;
		global.field[xSpot, ySpot].colour = global.opp;
		global.field[xSpot, ySpot].image_index = global.field[xSpot, ySpot].colour;
        }
    for(ySpot = ySpot; ySpot >= 1 && ySpot <= 3; ySpot += 1){
        global.field[xSpot, ySpot] = instance_create_depth(xSpot*cWidth, ySpot*cHeight,-5, oNode)
        if(global.play == 0){
			global.field[xSpot, ySpot].gridX = xSpot;
		}else{
			global.field[xSpot, ySpot].gridX = 2 - xSpot;
		}
        global.field[xSpot, ySpot].gridY = ySpot - 2;
		global.field[xSpot, ySpot].actualX = xSpot;
		global.field[xSpot, ySpot].actualY = ySpot;
		global.field[xSpot, ySpot].colour = global.play;
		global.field[xSpot, ySpot].image_index = global.field[xSpot, ySpot].colour;		
        }    
}



//add the supporting node
ySup = 0;
for(xSup = 0; xSup < 3; xSup += 1){
    if (ySup == 0){
    global.field[xSup, ySup].support = global.field[xSup, ySup + 1];
	global.field[xSup, ySup].rangedNode = global.field[xSup, ySup + 2];
    }
}

ySup = 1;
for(xSup = 0; xSup < 3; xSup += 1){    
    global.field[xSup, ySup].support = global.field[xSup, ySup - 1];
	global.field[xSup, ySup].meleeNode = global.field[xSup, ySup + 1];
	global.field[xSup, ySup].rangedNode = global.field[xSup, ySup + 2];
	global.field[xSup, ySup].frontNode = true;
}

ySup = 2;
for(xSup = 0; xSup < 3; xSup += 1){  
    global.field[xSup, ySup].support = global.field[xSup, ySup + 1];
	global.field[xSup, ySup].rangedNode = global.field[xSup, ySup - 2];
	global.field[xSup, ySup].meleeNode = global.field[xSup, ySup - 1];
	global.field[xSup, ySup].frontNode = true;	    
}

ySup = 3;
for(xSup = 0; xSup < 3; xSup += 1){
   
    global.field[xSup, ySup].support = global.field[xSup, ySup - 1];
	global.field[xSup, ySup].rangedNode = global.field[xSup, ySup - 2];
    
}

//create array to hold the decks
plDeck[0] = noone;
plDeck[1] = noone;
plDeck[2] = noone;

opDeck[0] = noone;
opDeck[1] = noone;
opDeck[2] = noone;

//create the decks
for(i=0;i<3;i+=1){
	plDeck[i] = instance_create_depth(cWidth*(3+i),cHeight*3,global.deckDepth,oDeck);
	plDeck[i].handX = hand1X+(cWidth+5)*i;
	plDeck[i].handY = y+cHeight*3;
	plDeck[i].type = i;
	plDeck[i].colour = global.play;
	plDeck[i].image_index = plDeck[i].type;
}

for(i=0;i<3;i+=1){
	opDeck[i] = instance_create_depth(cWidth*(3+i),0,global.deckDepth,oDeck);
	opDeck[i].handX = hand1X+(cWidth+5)*i;
	opDeck[i].handY = 0;
	opDeck[i].type = i;
	opDeck[i].colour = global.opp;
	opDeck[i].image_index = opDeck[i].type;
}

//put stuff in the deck
with oDeck{
	if type == 0{
		for(i=0;i<3;i+=1){
			scAddToDeck(oHunterAssassin);
		}/*
		for(i=0;i<2;i+=1){
			ds_list_add(decklist,oHunterBackup);
			ds_list_add(decklist,oHunterBladesman);
			ds_list_add(decklist,oHunterRecon);
			ds_list_add(decklist,oHunterSavage);
			ds_list_add(decklist,oHunterRecruiter);
		}
		ds_list_add(decklist,oHunterCollector);
		ds_list_add(decklist,oHunterQueen);
	*/}/*else if type == 1{
		for(i=0;i<2;i+=1){
			ds_list_add(decklist,oBloodSpear);
			ds_list_add(decklist,oBonetoothNecklace);
		}
	}else if type == 2{
		for(i=0;i<2;i+=1){
			ds_list_add(decklist,oCompetition);
			ds_list_add(decklist,oBloodsport);
		}
	}*/
}

//shuffle the decks
with oDeck ds_list_shuffle(decklist);

//create mouse stuff
global.hoverCard = noone;
global.selCard = noone;
global.hoverNode = noone;
global.selNode = noone;
global.hoverDeck = noone;
global.selDeck = noone;













