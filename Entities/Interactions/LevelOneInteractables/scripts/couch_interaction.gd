extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../Cutscene"
@onready var blackscreen = $"../blackscreen"
func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()

func _send_text():
	text_box.queue_text("","*It's an old client sofa.*")
	text_box.queue_text("Moreau", "\"I really need to a get a new couch for the office...\"")
	text_box.time_to_output = true
	pass
