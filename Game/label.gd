extends Label


var credits = "Developed by Team 12\n\nMade in association with:\nHusky Game Development"
var credits2 = "Developers:\nBrett Leonard\nAndrew Radke\nBen Kornas\nDustin Krontz"
var credits3 = "Artists:\nJosiah Parrott\nGabe Newell"
var credits4 = "Writer:\nDustin Krontz"
var credits5 = "Sound Team:\nNate Lyons\nZach Brouckman"
var credits6 = "Music Team:\nZach Broukman"
var credits7 = "Thank you for playing!"


func _ready() -> void:
	scroll_text(credits)
	scroll_text(credits2)
	scroll_text(credits3)
	scroll_text(credits4)
	scroll_text(credits5)
	scroll_text(credits6)
	scroll_text(credits7)


func scroll_text(input_text : String) -> void:
	visible_characters = 0
	text = input_text
	
	for i in text.length():
		visible_characters += 1
		await get_tree().create_timer(0.2).timeout
	
	visible_characters = 0
