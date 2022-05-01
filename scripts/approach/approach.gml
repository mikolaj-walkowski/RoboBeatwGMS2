// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function approach(value,target,increment){
	if(value != target){
		if(value < target)
			value = value + increment < target ? value + increment : target;
		else
			value = value - increment > target ? value - increment : target;
	}
	return value;
}