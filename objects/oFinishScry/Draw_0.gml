/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(global.gameState == gameStates.scry && global.player[global.play].scrying < 2){
	if (global.player[global.play].scryDeck != noone){
		if(global.player[global.play].scryDeck.scry != noone){
		}else event_inherited();
	}else event_inherited();
}
