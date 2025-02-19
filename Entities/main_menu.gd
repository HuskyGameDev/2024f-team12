extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SceneManager.scene_added_signal.connect(button_pressed)
	



func button_pressed():
	$Click.play()
	hide()


func _on_options_pressed() -> void:
	$Click.play()
	pass


func _on_exit_pressed():
	$Click.play()
	await get_tree().create_timer(.3).timeout
	get_tree().quit()
