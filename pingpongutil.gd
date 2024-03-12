extends Node
var _pp_direction = 1

func ping_pong_direction(value,max,min):
	if value > max:
		_pp_direction = -1
	elif value < min:
		_pp_direction = 1
	return _pp_direction
