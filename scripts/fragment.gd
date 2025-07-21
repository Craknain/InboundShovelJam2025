extends PanelContainer
class_name Fragment

const fragment : PackedScene = preload("res://scenes/Fragment.tscn")

@onready var type_label: Label = $MarginContainer/VBoxContainer/TypeLabel
@onready var value_label: Label = $MarginContainer/VBoxContainer/ValueLabel
@onready var texture_rect: TextureRect = $MarginContainer/VBoxContainer/TextureRect

var is_dragged = false
var is_draggable = false
var exporting : bool = false

var initial_position: Vector2
var offset : Vector2

var type: String # Genre or Theme
var value: String # What genre or what theme?
var texture: Texture

static func create_fragment(type: String, value: String, texture: Texture):
	var new_fragment = fragment.instantiate()
	new_fragment.type = type
	new_fragment.value = value
	new_fragment.texture = texture
	return new_fragment

func _ready():
	type_label.text = type
	value_label.text = value
	texture_rect.texture = texture

func _process(delta) -> void:
	if is_dragged:
		global_position = get_global_mouse_position() - offset
	if not exporting:
		if Input.is_action_just_pressed("click") and is_draggable:
			initial_position = get_global_position()
			offset = get_global_mouse_position() - initial_position
			is_dragged = true
	else:
		var stylebox: StyleBoxFlat = get_theme_stylebox("game_Theme").duplicate()
		stylebox.border_color = Color(0, 255, 0)
		add_theme_stylebox_override("panel", stylebox)
	if Input.is_action_just_released("click") and is_dragged:
		is_dragged = false
		set_global_position(initial_position)

func _on_mouse_entered() -> void:
	is_draggable = true

func _on_mouse_exited() -> void:
	is_draggable = false
