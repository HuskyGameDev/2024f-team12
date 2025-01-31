extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneManager.scene_added_signal.connect(button_pressed)
	



func button_pressed():
	hide()


func _on_options_pressed() -> void:
	pass


func _on_exit_pressed():
	get_tree().quit()
