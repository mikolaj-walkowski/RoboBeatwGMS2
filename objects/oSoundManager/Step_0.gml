if(beat_window_start + beat_T - window <= current_time && !beat_window){
	beat_window = true;
}

if(beat_window_start + beat_T <= current_time){
	beat = true;
	beat_window_start += beat_T;
	beat_happened = true;
}else{
	beat = false;
}

if( beat_window_start + window <= current_time && beat_happened){
	beat_window = false;
	beat_happened = false;
}

