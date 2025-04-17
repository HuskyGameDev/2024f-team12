extends Control

var inDialogue: bool = false

var endScene: bool = false

var evidencefound: Array[bool] = [false, false, false, false, false, false]

func _settingsOn():
	$MainMenu._on_options_pressed()
