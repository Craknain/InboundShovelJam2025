extends Control

func _ready() -> void:
	$VBoxContainer/masterbar.value=db_to_linear(AudioServer.get_bus_volume_db(0))
	$VBoxContainer/musicbar.value=db_to_linear(AudioServer.get_bus_volume_db(1))
	$VBoxContainer/sfxbar.value = db_to_linear(AudioServer.get_bus_volume_db(2))



func _on_masterbar_mouse_exited() -> void:
	release_focus()

func _on_musicbar_mouse_exited() -> void:
	release_focus()

func _on_sfxbar_mouse_exited() -> void:
	release_focus()
