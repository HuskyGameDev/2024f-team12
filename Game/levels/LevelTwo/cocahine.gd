extends Node2D

@onready var text_box = $"../ySort/Cutscene"
@onready var interaction_area: InteractionArea = $InteractionArea

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()

func _send_text():
	$".."._FindEvidence(2)
	text_box.queue_text("Moreau", "\"Looks like some drugs that the Mob has been moving. Might be able to use this as a bargaining chip.\"")
	text_box.time_to_output = true
	pass
