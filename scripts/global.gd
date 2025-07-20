extends Node

var days : float = 15

const irl_time : int = 10

var elapsed_time : float = 0 

func create_element(type: String, scene):
	match type:
		"Fragment":
			get_tree().get_first_node_in_group("fragment").add_child(scene)
		"Export":
			get_tree().get_first_node_in_group("export").add_child(scene)
		"Jam":
			pass
		
		
func reduce_days(amount: float):
	days -= amount
	elapsed_time = 0
func _process(delta) -> void:
	elapsed_time += delta
	
	if elapsed_time > irl_time:
		reduce_days(0.5)
		elapsed_time = 0
	
	if days <= 0:
		print("GAME IS DONE")
