extends Node2D

var ui_node: Control

func _ready() -> void:
	# Get access to the to the ui parent node that has all ui in the game as it's child
	ui_node = get_tree().get_nodes_in_group("ui")[0] as Control

func _process(delta: float) -> void:
	if ui_node != null:
		if !ui_node.inDialogue: #If not in dialogue the player can see the notebook & the button
			get_parent().show()
			if Input.is_action_just_pressed("J"):
				if !visible:
					show()
				elif visible:
					hide()
		else: #If in dialogue, hide the notebook & button
			get_parent().hide()


func _on_button_pressed() -> void:
	if !visible:
		show()
	elif visible:
		hide()
