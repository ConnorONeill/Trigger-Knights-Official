/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_right);
draw_text(room_width,55, "Gold: " + string(global.player[global.opp].gold) + "\n Mulls: " + string(global.player[global.opp].mulls) + "\n Extra Draw: " + string(global.player[global.opp].exDraw) + "\n Life: " + string(global.player[global.opp].hp));
draw_text(room_width,room_height/2 + 200,string(global.phase) + "\n" + string(global.turn));
var tempText;
tempText = string("Gold: " + string(global.player[global.play].gold) + "\n Mulls: " + string(global.player[global.play].mulls) + "\n Extra Draw: " + string(global.player[global.play].exDraw) + "\n Life: " + string(global.player[global.play].hp));
draw_text(room_width,room_height - string_height(tempText),tempText);
draw_set_halign(fa_center);
