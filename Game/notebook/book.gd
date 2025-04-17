extends Node2D

var ui_node: Control

var vistext: Array[bool] = [false, false, false, false, false, false]

func _ready() -> void:
	# Get access to the to the ui parent node that has all ui in the game as it's child
	ui_node = get_tree().get_nodes_in_group("ui")[0] as Control

func _process(delta: float) -> void:
	_update_evidence()
	if ui_node != null:
		if !ui_node.endScene: #If not in dialogue the player can see the notebook & the button
			get_parent().show()
			if Input.is_action_just_pressed("notebook"):
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

func _toggle_note(note, val) -> void:
	match note:
		0:
			if val == false:
				$"Sprite2D/Note 1".hide()
			else:
				$"Sprite2D/Note 1".show()
		1:
			if val == false:
				$"Sprite2D/Note 2".hide()
			else:
				$"Sprite2D/Note 2".show()
		2:
			if val == false:
				$"Sprite2D/Note 3".hide()
			else:
				$"Sprite2D/Note 3".show()
		3:
			if val == false:
				$"Sprite2D/Note 4".hide()
			else:
				$"Sprite2D/Note 4".show()
		4:
			if val == false:
				$"Sprite2D/Note 5".hide()
			else:
				$"Sprite2D/Note 5".show()
		5:
			if val == false:
				$"Sprite2D/Note 6".hide()
			else:
				$"Sprite2D/Note 6".show()

func on_evidence_found() -> void:
	pass

func _update_evidence() -> void:
	if ui_node != null:
		for i in range(6):
			if vistext[i] != ui_node.evidencefound[i]:
				vistext[i] = ui_node.evidencefound[i]
				_toggle_note(i, vistext[i])
