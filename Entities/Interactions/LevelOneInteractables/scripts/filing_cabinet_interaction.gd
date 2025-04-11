extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../Cutscene"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()

func _send_text():
	text_box.queue_text("","*It's some filing cabinets. All the old paperwork and evidence is stored there.*")
	text_box.queue_text("Moreau", "\"...\"")
	text_box.time_to_output = true
	pass
