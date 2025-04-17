extends Node2D

@onready var text_box = $Cutscene
@onready var blackscreen = $blackscreen
@onready var woman = $Cutscene/WomanCutscene
@onready var moreau = $Cutscene/MoreauCutscene
@onready var womanvoice = $Cutscene/WomanVoice
@onready var moreauvoice = $Cutscene/MoreauVoice

@onready var player = $Player

var ui_node: Control

var voiceplaying = false

# Main script for the first level of the game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.show()
	var ui_nodes = get_tree().get_nodes_in_group("ui")
	if ui_nodes.size() > 0:
		ui_node = ui_nodes[0] as Control
	else:
		ui_node = null 
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
	
	if text_box.curspeaker == "Woman" && voiceplaying == false:
		womanvoice.play()
		voiceplaying = true
	if text_box.curspeaker == "Mrs. Duval" && voiceplaying == false:
		womanvoice.play()
		voiceplaying = true
	elif text_box.curspeaker == "Moreau" && voiceplaying == false:
		moreauvoice.play()
		voiceplaying = true
	elif text_box.curspeaker == "" && voiceplaying == true:
		moreauvoice.stop()
		womanvoice.stop()
		voiceplaying = false
	
	if text_box.level1cutscene[1] > 0  && $DeskInteraction.visible:
		ui_node.evidencefound[1] = true
		$DeskInteraction.hide()
		$DeskInteraction.position.x = 10000
		$LeaveOffice.position.y = 150
	if text_box.level1exit[1] > 0:
		var game_node: Game = get_tree().get_nodes_in_group("game")[0] as Game
		SceneManager.swap_scenes("res://Game/levels/LevelzFour/LevelFour.tscn", game_node.screen_holder, $"." , "fade_to_dark")
	pass
