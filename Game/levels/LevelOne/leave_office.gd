extends Node2D


@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../Cutscene"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()


func _send_text():
	text_box.set_cutscene(2)
	text_box.queue_cutscene("Moreau", 0, "\"I should start investigating. I know exactly where to start.\"")
	text_box.queue_cutscene("", 4, "Are you ready to leave the office?")
	text_box.queue_cutscene("", 4, "Yes")
	text_box.queue_cutscene("", 5, "Not yet")
	text_box.queue_cutscene("", 6, "Maybe")
	text_box.queue_cutscene("", 7, "I'll think about it")
	text_box.queue_cutscene("", 8, "...")
	text_box.queue_cutscene("", 1, "Correct answer is 1") # doesn't actually print this, only uses the number
	text_box.queue_cutscene("", 0, "See you soon...") # only prints if select non-yes
	text_box.queue_cutscene("Moreau", 0, "\"Time to head to that old warehouse.\"")
	text_box.time_to_output = true
