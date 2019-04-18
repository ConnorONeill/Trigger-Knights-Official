var memes = argument0;
var target = argument1;

if(target.dying == true){
	scSendToGrave(target,true);
}
if(memes.objType == objTypes.card){
	scCollect(events.damDealt,noone,memes,target);
}else{
	scCollect(events.damDealt,memes,noone,target);
}