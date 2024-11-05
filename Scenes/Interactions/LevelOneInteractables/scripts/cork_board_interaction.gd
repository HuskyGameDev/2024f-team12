extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../Cutscene1"


func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()

func _send_text():
	text_box.queue_text("It's a cork board with lots of old cases.")
	text_box.queue_text("\" What a year it's been...\"")
	text_box.time_to_output = true
	# enqueue text "* It's a cork board with lots of old cases. *"
	# enqueue text "What a year it's been..."
	pass
