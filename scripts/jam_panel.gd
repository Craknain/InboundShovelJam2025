extends PanelContainer
class_name Jam

@onready var jam_genre_label: Label = $MarginContainer/VBoxContainer/JamGenre
@onready var jam_platform_label: Label = $MarginContainer/VBoxContainer/JamPlatform
@onready var jam_theme_label: Label = $MarginContainer/VBoxContainer/JamTheme
@onready var jam_duration_label: Label = $MarginContainer/VBoxContainer/JamDuration
@onready var jam_points: Label = $MarginContainer/VBoxContainer/JamPoints

const JAM_PANEL = preload("res://scenes/JamPanel.tscn")
var dragged_object : Export = null

var jam_theme : String
var jam_genre : String
var jam_platform : String
var duration: float = 21.0

var points: int

static func create_jam(jam_theme : String, jam_genre : String, jam_platform: String, duration : float, points : int):
	var new_jam = JAM_PANEL.instantiate()
	new_jam.jam_theme = jam_theme
	new_jam.jam_genre = jam_genre
	new_jam.jam_platform = jam_platform
	new_jam.duration = duration
	new_jam.points = points
	return new_jam
	
func _ready():
	jam_theme_label.text = jam_theme
	jam_genre_label.text = jam_genre
	jam_platform_label.text = jam_platform
	jam_duration_label.text = str(duration) + " day(s)"
	jam_points.text = str(points) + " pts"

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("click") and dragged_object:
		submit_project(dragged_object)
		dragged_object.queue_free()
		queue_free()
		if get_tree().get_first_node_in_group("jam").get_child_count() == 0:
			Global.add_random_jam()
		
func _process(delta: float) -> void:
	if duration <= 0:
		queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Export:
		dragged_object = area.get_parent()

func _on_area_2d_area_exited(area: Area2D) -> void:
	dragged_object = null
	
func submit_project(project : Export):
	# Need to test if dragged_object is the one needed, and grant or lose points according to result
	if dragged_object.game_theme == jam_theme and dragged_object.game_genre == jam_genre:
		Global.add_points(points)

func reduce_days(amount: float):
	duration -= amount
	jam_duration_label.text = str(duration) + " day(s)"


func _on_leave_button_pressed() -> void:
	queue_free()
	if get_tree().get_first_node_in_group("jam").get_child_count() == 0:
		Global.add_random_jam()
