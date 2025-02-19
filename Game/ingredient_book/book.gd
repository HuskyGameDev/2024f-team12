extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("J"):
		if !visible:
			show()
		elif visible:
			hide()

func _on_button_pressed() -> void:
	if !visible:
		show()
	elif visible:
		hide()
