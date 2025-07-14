extends PanelContainer

var dragged_object = null

var game_name : String


func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("click") and dragged_object:
		dragged_object.queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	dragged_object = area.get_parent()
	
	#area.get_parent().queue_free()
	


func _on_area_2d_area_exited(area: Area2D) -> void:
	dragged_object = null
	
func submit_project():
	if dragged_object.game_theme == "test":
		pass
