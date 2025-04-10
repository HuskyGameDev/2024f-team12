extends CharacterBody2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../Cutscene"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var timesinteracted: int = 0



func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	match timesinteracted:
		0:
			text_box.queue_text("Police Officer", "\"I don't feel like helping you, Moreau. Go talk to the witnesses yourself.\"")
		1:
			text_box.queue_text("Police Officer", "\"What, are you deaf? Go away.\"")
		2:
			text_box.queue_text("Police Officer", "\"Man, the guys weren't joking when they said detectives can't take a hint.\"")
			text_box.queue_text("Police Officer", "\"Here, I'll say it slow for ya. Go. Talk. To. Someone. Else.\"")
		3:
			text_box.queue_text("Police Officer", "\"Alright, that's it. I'm playing the silent game from here on out.\"")
		_:
			text_box.queue_text("Police Officer", "\"...\"")
	
	timesinteracted += 1
	text_box.time_to_output = true
