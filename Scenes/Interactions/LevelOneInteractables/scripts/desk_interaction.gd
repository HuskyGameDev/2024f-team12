extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../Cutscene1"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()

func _send_text():
	text_box.queue_cutscene("", "It's a massive desk, and quite cluttered.", "*")
	text_box.queue_cutscene("Moreau", "Man, I've gotta work on cleaning this place up.", "\"")
	text_box.time_to_output = true
	# Begins the cutscene, First only moreau is visible
	# enqueue text "* It's a massive desk, and quite cluttered. *"
	# enqueue text "Man, I gotta work on cleaning this place up"
	# screen shakes, panicked woman enters
	
	pass
