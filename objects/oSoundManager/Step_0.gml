if(beat_window_start + beat_T - windowBf <= current_time && !beat_window){
	beat_window = true;
	//show_debug_message("BStart");
	//show_debug_message(current_time);
}

if(beat_window_start + beat_T <= current_time){
	beat = true;
	beat_window_start += beat_T;
	beat_happened = true;
	//show_debug_message("BMid");
	//show_debug_message(current_time);
}else{
	beat = false;
}

if( beat_window_start + windowAf <= current_time && beat_happened){
	beat_window = false;
	beat_happened = false;
	//show_debug_message("BEnd");
	//show_debug_message(current_time);
}

