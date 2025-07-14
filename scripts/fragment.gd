extends PanelContainer
class_name Fragment


@onready var type_label: Label = $MarginContainer/VBoxContainer/TypeLabel
@onready var value_label: Label = $MarginContainer/VBoxContainer/ValueLabel
@onready var texture_rect: TextureRect = $MarginContainer/VBoxContainer/TextureRect

var type: String # Genre or Theme
var value: String # What genre or what theme?
var texture: Texture
const fragment : PackedScene = preload("res://scenes/Fragment.tscn")

func _ready():
	type_label.text = type
	value_label.text = value
	texture_rect.texture = texture

static func create_fragment(type: String, value: String, texture: Texture):
	var new_fragment = fragment.instantiate()
	new_fragment.type = type
	new_fragment.value = value
	new_fragment.texture = texture
	return new_fragment
	
