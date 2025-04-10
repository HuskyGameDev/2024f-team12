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
	$"..".evidencefound[3] = 1
	text_box.queue_text("Moreau", "\"This is definitely dirty money. Might be able to use this when I talk to him.\"")
	text_box.time_to_output = true
	pass
