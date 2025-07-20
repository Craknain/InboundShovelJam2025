class_name Export extends PanelContainer


const new_export: PackedScene = preload("res://scenes/Exports.tscn")
@onready var genre_label: Label = $MarginContainer/VBoxContainer/Genre
@onready var theme_label: Label = $MarginContainer/VBoxContainer/Theme
@onready var platform_label: Label = $MarginContainer/VBoxContainer/Platform
@onready var texture_rect: TextureRect = $MarginContainer/VBoxContainer/TextureRect

var is_dragged : bool = false
var is_draggable : bool = false

var game_theme: String
var game_genre: String
var game_platform: String

var initial_position: Vector2
var offset : Vector2
		
static func create_export(theme: String, genre: String, platform: String):
	var export = new_export.instantiate()
	export.game_theme = theme 
	export.game_genre = genre
	export.game_platform = platform
	return export
	
func _ready() -> void:
	genre_label.text = game_genre
	theme_label.text = game_theme
	platform_label.text = game_platform

func _process(delta) -> void:
	if is_dragged:
		global_position = get_global_mouse_position() - offset
	if Input.is_action_just_pressed("click") and is_draggable:
		initial_position = get_global_position()
		offset = get_global_mouse_position() - initial_position
		is_dragged = true
	if Input.is_action_just_released("click") and is_dragged:
		is_dragged = false
		set_global_position(initial_position)



func _on_mouse_entered() -> void:
	is_draggable = true

func _on_mouse_exited() -> void:
	is_draggable = false
		
		
