extends PanelContainer
class_name Generator

# On ready
@onready var title_label: Label = $MarginContainer/VBoxContainer/TitleLabel
@onready var duration_label: Label = $MarginContainer/VBoxContainer/DurationLabel
@onready var create_button: Button = $MarginContainer/VBoxContainer/CreateButton
@onready var texture_rect: TextureRect = $MarginContainer/VBoxContainer/TextureRect

# Exports
@export_file("*.svg", "*.jpg", "*.png") var image = "res://icon.svg"
@export_color_no_alpha var background_color: Color
@export_color_no_alpha var border_color: Color
@export var duration: float = 0.5

# Variables
@export var title : String = "Titre"
@export_enum("Theme", "Genre") var type : String = "Theme"


func _ready():
	# Set title text and set button invisible
	title_label.text = title
	duration_label.text = str(duration) + " day(s)"
	
	# Modify image
	texture_rect.texture = load(image)
	
	# Style
	var stylebox: StyleBoxFlat = get_theme_stylebox("panel").duplicate()
	stylebox.bg_color = background_color
	stylebox.border_color = border_color
	stylebox.shadow_color = border_color
	add_theme_stylebox_override("panel", stylebox)

func _on_create_button_pressed() -> void:
	Global.create_element("Fragment", Fragment.create_fragment(type, title, load(image)))
	Global.reduce_days(duration)
