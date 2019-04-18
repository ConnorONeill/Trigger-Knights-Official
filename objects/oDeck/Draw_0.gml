/// @description Insert description here
// You can write your code in this editor
draw_self();
deckSize = ds_list_size(decklist);
draw_set_halign(fa_center);
draw_text(x+cWidth/2,y+cHeight/2,string(deckSize));
