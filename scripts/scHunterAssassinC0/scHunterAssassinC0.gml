if(global.event == events.attacked and global.prio == prio and host.position == positions.field and global.keyCardA[global.I] == host){
	return 0;
}else return -1;
