extends PanelContainer
class_name Exporter

const exporter = preload("res://scenes/Exporter.tscn")

var dragged_object : Fragment = null

@export_enum("PC", "Mobile", "Console") var type: String = "PC"
@onready var type_label: Label = $MarginContainer/VBoxContainer/TypeLabel
@onready var export_button: Button = $MarginContainer/VBoxContainer/ExportButton
@onready var first_fragment: TextureRect = $MarginContainer/VBoxContainer/HBoxContainer/FirstFragment
@onready var second_fragment: TextureRect = $MarginContainer/VBoxContainer/HBoxContainer/SecondFragment

var exported_fragments : Dictionary[String, Fragment] = {'fragment_one': null, 'fragment_two': null}

func _ready():
	type_label.text = type

static func create_exported(type: String):
	var new_exporter = exporter.instantiate()
	new_exporter.type = type
	return new_exporter
	
func _process(delta) -> void:
	if !(exported_fragments['fragment_one'] and exported_fragments['fragment_two']):
		export_button.visible = false
	else:
		export_button.visible = true
	
	if exported_fragments['fragment_one']:
		first_fragment.texture = exported_fragments['fragment_one'].texture
	else:
		first_fragment.texture = null
		
	if exported_fragments['fragment_two']:
		second_fragment.texture = exported_fragments['fragment_two'].texture
	else:
		second_fragment.texture = null
		
	if Input.is_action_just_released("click") and dragged_object:
		# submit_project()
		add_fragment(dragged_object)
		dragged_object = null
		
	
func add_fragment(fragment: Fragment):
	if exported_fragments['fragment_one']:
		if exported_fragments['fragment_two']:
			return
		exported_fragments['fragment_two'] = fragment
	else:
		exported_fragments['fragment_one'] = fragment
		
func _on_export_button_pressed() -> void:
	if exported_fragments['fragment_one'].type == exported_fragments['fragment_two'].type:
		print("Pas un bon export")
	elif exported_fragments['fragment_one'].type == "Theme":
		var new_export = Export.create_export(exported_fragments['fragment_one'].value, exported_fragments['fragment_two'].value, type)
		exported_fragments['fragment_one'].queue_free()
		exported_fragments['fragment_two'].queue_free()
		
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Fragment:
		dragged_object = area.get_parent()

func _on_area_2d_area_exited(area: Area2D) -> void:
	dragged_object = null
