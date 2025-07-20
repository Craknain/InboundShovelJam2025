extends Control

@onready var options: Control = $"."



func _on_back_pressed() -> void:
	options.hide()

func _on_apply_pressed() -> void:
	AudioServer.set_bus_volume_db(0,linear_to_db($"audio-options/VBoxContainer/masterbar".value))
	AudioServer.set_bus_volume_db(1, linear_to_db($"audio-options/VBoxContainer/musicbar".value))
	AudioServer.set_bus_volume_db(2, linear_to_db($"audio-options/VBoxContainer/sfxbar".value))
