/// @description Insert description here
// You can write your code in this editor

audio_play_sound(sndBattleMetalSong,100,true);
beat_window_start=current_time;
//var _on_beat = fx_create("_filter_tintfilter")
//if(_on_beat == -1){
//	show_debug_message("ohno");
//}else{
//fx_set_parameter(_on_beat,"g_TintCol", [0.25, 0.25, 0.25, 1]);
//}

beat_T= (60/45)*1000;

window = 175;

beat = false;
beat_window= false;
