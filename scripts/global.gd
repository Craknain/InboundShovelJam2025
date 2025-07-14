extends Node


func create_element(type: String, scene):
	match type:
		"Fragment":
			if scene.type == "Theme":
				get_tree().get_first_node_in_group("theme").add_child(scene)
			elif scene.type == "Genre":
				get_tree().get_first_node_in_group("genre").add_child(scene)
		"Export":
			get_tree().get_first_node_in_group("export").add_child(scene)
		"Jam":
			pass
		
		
