extends Node

func run_periodically(function, period):
	var timer = Timer.new()
	timer.set_wait_time(period)
	timer.set_one_shot(false)
	timer.connect("timeout",function)
	add_child(timer)
	timer.start()
	return timer

func create_array2D(x:int,y:int,initial_value = null):
	var arr1 = []
	arr1.resize(y)
	for i in y:
		var arr2 = []
		arr2.resize(x)
		arr2.fill(initial_value)
		arr1[i] = arr2
	return arr1

func dict_map(dict,callable):
	if !dict.is_empty():
		for key in dict.keys():
			dict[key] = callable.call(dict[key])

func dict_sort_custom(dict,callable):
	if !dict.is_empty():
		var keys = dict.keys()
		var sort_values = dict.values()
		sort_values.sort_custom(callable)
		for i in keys.size():
			dict[keys[i]] = sort_values[i]

func num_dict_append(dict,value):
	if dict.is_empty():
		dict[0] = value
	elif dict.keys().back() is int:
		dict[dict.keys().back()+1] = value
	
func get_all_children(node):
	var children_array = []
	append_children(node,children_array)
	return children_array

func append_children(node,array):
	for child in node.get_children():
		array.append(child)
		if child.get_child_count() != 0:
			append_children(child,array)

