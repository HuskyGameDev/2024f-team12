extends Node2D

@onready var text_box = $"../Cutscene"
@onready var interaction_area: InteractionArea = $InteractionArea

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()

func _send_text():
	text_box.queue_text("", "*Looks to just be an empty dumpster*")
	text_box.queue_text("Moreau", "\"Glad it's empty, don't feel like digging through garbage right now.\"")
	position.x = 918
	position.y = -187
	text_box.time_to_output = true
	pass
