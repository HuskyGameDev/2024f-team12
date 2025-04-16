extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../Cutscene"

var ui_node: Control

func _ready():
	var ui_nodes = get_tree().get_nodes_in_group("ui")
	if ui_nodes.size() > 0:
		ui_node = ui_nodes[0] as Control
	else:
		ui_node = null 
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		ui_node.evidencefound[0] = true
		_send_text()

func _send_text():
	text_box.queue_text("","*It's a picture of a woman.*")
	text_box.queue_text("Moreau","\"I know you're out there somewhere.\"")
	text_box.time_to_output = true
	pass
