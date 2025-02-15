extends Node2D

@onready var text_box = $Cutscene
@onready var blackscreen = $blackscreen
@onready var woman = $Cutscene/WomanCutscene
@onready var moreau = $Cutscene/MoreauCutscene

# Main script for the first level of the game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if text_box.blackscreen == true && blackscreen.z_index == 0:
		blackscreen.z_index = 30
	elif text_box.blackscreen == false && blackscreen.z_index == 30:
		blackscreen.z_index = 0
	if text_box.speakertwo == true: # && !woman.visible:
		woman.show()
		woman.play("default")
	elif text_box.speakertwo == false: # && woman.visible:
		woman.stop()
		woman.hide()
	if text_box.speakerone == true: # && !moreau.visible:
		moreau.show()
		moreau.play("default")
	elif text_box.speakertwo == false: # && moreau.visible:
		moreau.stop()
		moreau.hide()
	pass
