extends Control


@onready var score_label: Label = $ScoreLabel

func _ready():
	score_label.text = "You have scored " + str(Global.points) + " points"
