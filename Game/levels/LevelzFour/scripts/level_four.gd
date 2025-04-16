extends Node2D

@onready var text_box = $ySort/Cutscene
@onready var blackscreen = $ySort/Cutscene/blackscreen
@onready var endcard = $ySort/Cutscene/Sprite2D
@onready var moreau = $ySort/Cutscene/MoreauCutscene
@onready var mobboss = $ySort/Cutscene/MobBossCutscene
@onready var mobbossvoice = $ySort/Cutscene/MobBossVoice
@onready var moreauvoice = $ySort/Cutscene/MoreauVoice

@onready var player = $ySort/Player

var blackscreenvisible = false
var endcardvisible = false
var voiceplaying = false
var updateVisitTwo = false
var evidencefound = [0,0,0,0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.show()
	player.loud_steps()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player._getWarehouse() == true && updateVisitTwo == false:
		updateVisitTwo = true
		_resetRoundTwo()
	
	if text_box.blackscreen == true && blackscreenvisible == false:
		$MusicLoop.play()
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
	
	if text_box.sfxplay1 == true:
		$ySort/Cutscene/GunUnholster.play()
		text_box.sfxplay1 = false
	
	if text_box.sfxplay2 == true:
		$MusicLoop.stop()
		$ySort/Cutscene/GunShot.play()
		text_box.sfxplay2 = false
	
	if text_box.finalcutscene[1] > 0 && endcardvisible == false:
		print("EndOfGame")
		endcardvisible = true
		endcard.show()

func _FindEvidence(evnum):
	evidencefound[evnum] = 1

func _GetEvidence():
	return evidencefound

func _resetRoundTwo():
	pass
