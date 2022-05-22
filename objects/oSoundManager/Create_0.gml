/// @description Insert description here
// You can write your code in this editor

audio_play_sound(sndBattleMetalSong,100,true);

beat_T= (60/45)*1000;

beat_window_start=current_time + beat_T;

windowBf = 200;
windowAf = 100;

beat = false;
beat_happened = false;
beat_window= false;
