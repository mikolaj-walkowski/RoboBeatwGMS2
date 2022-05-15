if(beat_window_start + beat_T - window <= current_time){
	beat_window = true;
}

if(beat_window_start + beat_T <= current_time){
	beat = true;
	show_debug_message("beat"); 
	beat_window_start += beat_T;
}else{
	beat = false;
}
if( beat_window_start + window <= current_time){
	beat_window = false;
}

