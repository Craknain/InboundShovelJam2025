extends Control

@onready var margin_container: MarginContainer = $MarginContainer

func _ready() -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Game.tscn")

func _on_options_pressed() -> void:
	margin_container.hide()

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
	
	
	
