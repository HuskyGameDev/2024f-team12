class_name HotkeyRebindButton

extends Control


@onready var label: Label = $HBoxContainer/Label as Label
@onready var label_2: Label = $HBoxContainer/Label2 as Label


@export var action_name : String = "left"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_key()


func set_action_name() -> void:
	label.text = "Unassigned"
	
	match action_name:
		"left":
			label.text = "Move Left"
		"right":
			label.text = "Move Right"
		"up":
			label.text = "Move Up"
		"down":
			label.text = "Move Down"
		"primary_action":
			label.text = "Interact"
		"skip":
			label.text = "Skip"
		"Pause":
			label.text = "Pause"
		"notebook":
			label.text = "Journal"


func set_text_for_key() -> void:
	var action_events = InputMap.action_get_events(action_name)
	var action_event = action_events[0]
	var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
	
	label_2.text = "%s" % action_keycode
