extends Node2D

@onready var days_label: Label = $DaysLabel
@onready var points_label: Label = $PointsLabel
@onready var spawn_jam_timer: Timer = $SpawnJamTimer

func _ready():
	Global.set_process(true)
	spawn_jam_timer.start()
	days_label.text = str(Global.days) + " day(s)"
	points_label.text = str(Global.points) + " points"
	Global.connect("days_passed", on_days_passed)
	Global.connect("points_earned", on_points_earned)
	Global.add_random_jam()
	Global.add_random_jam()
	
	
func on_days_passed():
	days_label.text = str(Global.days) + " day(s)"

func on_points_earned():
	points_label.text = str(Global.points) + " points"

func _on_spawn_jam_timer_timeout() -> void:
	Global.add_random_jam()
