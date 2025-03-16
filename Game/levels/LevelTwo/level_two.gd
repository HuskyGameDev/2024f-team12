extends Node2D

@onready var text_box = $ySort/Cutscene
@onready var blackscreen = $ySort/Cutscene/blackscreen
@onready var moreau = $ySort/Cutscene/MoreauCutscene
@onready var mobboss = $ySort/Cutscene/MobBossCutscene
@onready var mobbossvoice = $ySort/Cutscene/MobBossVoice
@onready var moreauvoice = $ySort/Cutscene/MoreauVoice

var blackscreenvisible = false
var voiceplaying = false

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
	if text_box.speakertwo == true: # && !woman.visible:
		mobboss.show()
		mobboss.play("default")
	elif text_box.speakertwo == false: # && woman.visible:
		mobboss.stop()
		mobboss.hide()
	if text_box.speakerone == true: # && !moreau.visible:
		moreau.show()
		moreau.play("default")
	elif text_box.speakertwo == false: # && moreau.visible:
		moreau.stop()
		moreau.hide()
	
	if text_box.curspeaker == "???" && voiceplaying == false:
		mobbossvoice.play()
		voiceplaying = true
	elif text_box.curspeaker == "Moreau" && voiceplaying == false:
		moreauvoice.play()
		voiceplaying = true
	elif text_box.curspeaker == "" && voiceplaying == true:
		moreauvoice.stop()
		mobbossvoice.stop()
		voiceplaying = false
