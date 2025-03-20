extends Control


func button_pressed():
	$Click.play()
	hide()


func _on_start_pressed() -> void:
	$Click.play()
	hide()


func _on_options_pressed() -> void:
	$Click.play()
	$VBoxContainer.visible = false
	$Settings.visible = true


func _on_options_exit_pressed() -> void:
	$Click.play()
	$VBoxContainer.visible = true
	$Settings.visible = false


func _on_exit_pressed():
	$Click.play()
	await get_tree().create_timer(.3).timeout
	get_tree().quit()
