extends PanelContainer

var dragged_object : Export = null

var game_name : String


func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("click") and dragged_object:
		# submit_project()
		dragged_object.queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Export:
		dragged_object = area.get_parent()
	
	#area.get_parent().queue_free()
	


func _on_area_2d_area_exited(area: Area2D) -> void:
	dragged_object = null
	
func submit_project():
	# Need to test if dragged_object is the one needed, and grant or lose points according to result
	if dragged_object.game_theme == "test":
		pass
