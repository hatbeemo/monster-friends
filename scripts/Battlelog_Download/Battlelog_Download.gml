function Battlelog_Download(){
	//Send the log as a file.
	download_file_inbrowser(global._battle_log,"mf_battle_log.txt")
	return true;
}