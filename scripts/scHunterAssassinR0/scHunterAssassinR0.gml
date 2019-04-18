if(stage == 0){
	host.pow += 10;
	stage += 1;
	return false;
}if(stage == 1){
	stage = 0;
	return true;
}