extends Node


const MAX_JAMS = 3
const irl_time : int = 10
const themes : Array[String] = ["Mythology", "Fantasy", "Puzzle"]
const genres : Array[String] = ["Platformer", "Tower Defense", "Roguelike"]
const platforms : Array[String] = ["PC", "Console", "Mobile"]
const possible_points : Array[int] = [20,30,40,50]

var days : float = 15.0
var points : int = 0
var elapsed_time : float = 0 



signal days_passed
signal points_earned

func create_element(type: String, scene):
	match type:
		"Fragment":
			get_tree().get_first_node_in_group("fragment").add_child(scene)
		"Export":
			get_tree().get_first_node_in_group("export").add_child(scene)
		"Jam":
			get_tree().get_first_node_in_group("jam").add_child(scene)

func _ready():
	set_process(false)

func _process(delta) -> void:
	elapsed_time += delta
	if elapsed_time > irl_time:
		reduce_days(0.5)
		elapsed_time = 0
	
	if days <= 0:
		Global.set_process(false)
		get_tree().change_scene_to_file("res://scenes/Victory.tscn")
		
func add_points(amount: int):
	points += amount
	points_earned.emit()

func reduce_days(amount: float):
	days -= amount
	for child in get_tree().get_first_node_in_group("jam").get_children():
		child.reduce_days(amount)
	elapsed_time = 0
	days_passed.emit()
	
	
func add_random_jam():
	if get_tree().get_first_node_in_group("jam").get_child_count() < MAX_JAMS:
		var jam_theme = themes.pick_random()
		var jam_genre = genres.pick_random()
		var platform = platforms.pick_random()
		var new_jam = Jam.create_jam(jam_theme, jam_genre, platform, ceil(randf_range(2.0, 5.0)), possible_points.pick_random())
		create_element("Jam", new_jam)
		
		
	
	
