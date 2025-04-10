extends Node2D

@onready var text_box = $Cutscene
@onready var blackscreen = $Cutscene/blackscreen

var voiceplaying: bool = false
var alleydoorunlocked: bool = false
var kitchenkey: bool = false
var blackscreenvisible: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if text_box.blackscreen == true && blackscreenvisible == false:
		blackscreen.show()
		blackscreenvisible = true
	elif text_box.blackscreen == false && blackscreenvisible == true:
		blackscreen.hide()
		blackscreenvisible = false
	
	if voiceplaying == false && text_box.curspeaker == "Police Officer":
		$"Po-Po/AudioStreamPlayer2D".play()
		voiceplaying = true
	if voiceplaying == false && text_box.curspeaker == "Moreau":
		$Player/MoreauVoice.play()
		voiceplaying = true
	if voiceplaying == false && text_box.curspeaker == "Mrs. Duval":
		$MrsDuval/WomanVoice.play()
		voiceplaying = true
	if voiceplaying == true && text_box.curspeaker == "":
		$"Po-Po/AudioStreamPlayer2D".stop()
		$Player/MoreauVoice.stop()
		$MrsDuval/WomanVoice.stop()
		voiceplaying = false
	
