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
			text_box.queue_text("Mrs. Duval", "\"Moreau, you're here! Have you gotten any information on Tony???\"")
			text_box.queue_text("Moreau", "\"I'm sorry mam, but my leads pointed me back here, so I have to do some looking around.\"")
			text_box.queue_text("Moreau", "\"Have the police found anything yet?\"")
			text_box.queue_text("Mrs. Duval", "\"No, they were no help at all. Only two showed up when I called, and they barely even glanced around.\"")
			text_box.queue_text("Mrs. Duval", "\"I'm pretty sure the only reason why this one is still here is because I gave him pie.\"")
			text_box.queue_text("Mrs. Duval", "\"Maybe you'll be able to find something. Here's the key for the kitchen, please look around.\"")
			text_box.queue_text("Moreau", "\"Thank you. I'll do my best to get your husband back to you.\"")
		_:
			text_box.queue_text("Mrs. Duval", "\"...\"")
	
	$"..".kitchenkey = true
	
	timesinteracted += 1
	text_box.time_to_output = true
