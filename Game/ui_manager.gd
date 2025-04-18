extends Control

var inDialogue: bool = false

var endScene: bool = false

var evidencefound: Array[bool] = [false, false, false, false, false, false]

func _settingsOn():
	$MainMenu._on_options_pressed()

func notebooksound():
	$Journal/sfxnotebook.play()
	await get_tree().create_timer(0.5).timeout
	$Journal/sfxnotebook.stop()

func updateEvidence(evnum, val):
	evidencefound[evnum] = val
	notebooksound() 
