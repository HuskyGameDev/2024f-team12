extends Control

signal exitSettings

func button_pressed():
	$Click.play()
	hide()


func _on_start_pressed() -> void:
	$Click.play()
	$MusicLoop.stop()
	hide()
	await get_tree().create_timer(.5).timeout
	$"../Journal/Button".show()


func _on_options_pressed() -> void:
	$Click.play()
	$VBoxContainer.visible = false
	$Settings.visible = true


func _on_options_exit_pressed() -> void:
	$Click.play()
	$VBoxContainer.visible = true
	$Settings.visible = false
	exitSettings.emit()


func _on_exit_pressed():
	$Click.play()
	await get_tree().create_timer(.3).timeout
	get_tree().quit()
