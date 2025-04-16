extends Label


var credits = "Developed by Team 12\n\nMade in association with:\nHusky Game Development"
var credits2 = "Developers:\nBrett Leonard\nAndrew Radke\nBen Kornas\nDustin Krontz"
var credits3 = "Artists:\nJosiah Parrott\nGabe Newell"
var credits4 = "Writer:\nDustin Krontz"
var credits5 = "Sound Team:\nNate Lyons\nZach Brouckman"
var credits6 = "Music Team:\nZach Broukman"
var credits7 = "Thank you for playing!!!"


func _ready() -> void:
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
	


func scroll_text(input_text : String) -> void:
	visible_characters = 0
	text = input_text
	
	for i in text.length():
		visible_characters += 1
		await get_tree().create_timer(0.1).timeout
	
