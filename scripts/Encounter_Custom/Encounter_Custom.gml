function Encounter_Custom() {
	Encounter_Set(0,-1,battle_enemy,-1,"* You encountered nothing!",-1);
	
	Encounter_Set(2,-1,battle_enemy_autoriel,-1,"* Oh god oh fuck",/*mus_autoriel_battle*/-1);
	//"{face 10}{face_emotion 2}{voice 3}* T-This isn't good..."
	Encounter_Set(1,-1,battle_enemy_gospel,-1,"* Gospel prepares to strike!",-1);
	//Encounter_Set(1,-1,battle_enemy_gospel,-1,"* Gospel prepares to strike!",mus_vs_gospel);
}
