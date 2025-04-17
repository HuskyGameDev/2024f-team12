extends Node2D

@onready var text_box = $"../ySort/Cutscene"
@onready var interaction_area: InteractionArea = $InteractionArea

var ui_node: Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ui_nodes = get_tree().get_nodes_in_group("ui")
	if ui_nodes.size() > 0:
		ui_node = ui_nodes[0] as Control
	else:
		ui_node = null 
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		
		_send_text()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _send_text():
	$".."._FindEvidence(1)
	text_box.lockpickmode = true
	var arr = $".."._GetEvidence()
	match arr[0]:
		0:
			text_box.queue_cutscene("Moreau", 0, "Some sort of lockbox. Maybe it has some useful information in it")
		1:
			text_box.queue_cutscene("Moreau", 0, "Another lockbox, hopefully it has more evidence like the last one.")
	
	text_box.queue_cutscene("Moreau", 0, "Seems like reciepts for child support payments, I don't recognize the name of the mother, seems to be a secret mistress.")
	position.y = 10000
	position.x = 10000
	text_box.time_to_output = true
	
	await text_box.outputcomplete
	ui_node.evidencefound[2] = true
	
	pass
