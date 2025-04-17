extends Label


var credits = "Developed by Team 12\n\nMade in association with:\nHusky Game Development"
var credits2 = "Developers:\nBrett Leonard\nAndrew Radke\nBen Kornas\nDustin Krontz\nJosiah Parrott"
var credits3 = "Artists:\nJosiah Parrott\nGabe Molnar"
var credits4 = "Writer:\nDustin Krontz"
var credits5 = "Sound Team:\nNate Lyons\nZach Brouckman"
var credits6 = "Music Team:\nZach Broukman"
var credits7 = "Thank you for playing!!!"

var ui_node: Control

@onready var animatioin: AnimatedSprite2D = $"../../AnimatedSprite2D"

func _ready() -> void:
	var ui_nodes = get_tree().get_nodes_in_group("ui")
	if ui_nodes.size() > 0:
		ui_node = ui_nodes[0] as Control
	else:
		ui_node = null 
	
	animatioin.play()
	
	ui_node.endScene = true
	
	scroll_text(credits)
	await get_tree().create_timer(10).timeout
	scroll_text(credits2)
	await get_tree().create_timer(10).timeout
	scroll_text(credits3)
	await get_tree().create_timer(10).timeout
	scroll_text(credits4)
	await get_tree().create_timer(10).timeout
	scroll_text(credits5)
	await get_tree().create_timer(10).timeout
	scroll_text(credits6)
	await get_tree().create_timer(10).timeout
	scroll_text(credits7)
	await get_tree().create_timer(10).timeout
	ui_node.inDialogue = false
	
	# TEST
	# var game_node: Game = get_tree().get_nodes_in_group("game")[0] as Game
	# SceneManager.swap_scenes("res://Entities/main_menu.tscn", game_node.screen_holder, $"." , "fade_to_dark")
	# TEST
	
	await get_tree().create_timer(.3).timeout
	get_tree().quit()


func scroll_text(input_text : String) -> void:
	visible_characters = 0
	text = input_text
	
	for i in text.length():
		visible_characters += 1
		await get_tree().create_timer(0.1).timeout
	
