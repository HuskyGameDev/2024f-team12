extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("J"):
		if hidden:
			show()
	if Input.is_action_just_pressed("ui_cancel"):
		if visible:
			hide()

func _on_button_pressed() -> void:
	show()

func _on_j_pressed() -> void:
	show()

func _on_exit_pressed() -> void:
	hide()
