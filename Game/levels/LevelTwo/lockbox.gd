extends Node2D

@onready var text_box = $"../ySort/Cutscene"
@onready var interaction_area: InteractionArea = $InteractionArea

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _send_text():
	text_box.lockpickmode = true
	text_box.queue_cutscene("Moreau", 0, "Some sort of lockbox. Maybe it has some useful information in it")
	text_box.queue_cutscene("Moreau", 0, "Huh, some evidence. I can use this to my advantage")
	text_box.time_to_output = true
	pass
