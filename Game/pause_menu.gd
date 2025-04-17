extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_resume_pressed():
	$Click.play()
	await get_tree().create_timer(.1).timeout
	hide()
	get_tree().paused = false

func _on_exit_pressed():
	$Click.play()
	await get_tree().create_timer(.3).timeout
	get_tree().quit()

func _on_settings_pressed():
	hide()
	get_tree().paused = false
	$"..".inDialogue = true
	$"../MainMenu".show()
	$"../MainMenu"._on_options_pressed()
	await $"../MainMenu".exitSettings
	$"..".inDialogue = false
	$"../MainMenu".hide()
	get_tree().paused = true
	show()
