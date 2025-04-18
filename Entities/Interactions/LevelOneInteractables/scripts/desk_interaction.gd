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
		_send_text()


func _send_text():
	text_box.set_cutscene(1)
	text_box.queue_cutscene("", 0, "*It's a massive desk, and is suprisingly cluttered.*")
	text_box.queue_cutscene("Moreau", 1, "\"Man, I've gotta work on cleaning this place up.\"")
	#screen shakes? Woman enters
	
	text_box.queue_cutscene("Woman", -12, "\"Are you detective Moreau?!? I need your help!\"")
	text_box.queue_cutscene("Moreau", 0, "\"Indeed, I'm Moreau. What can I do for you?\"")
	text_box.queue_cutscene("Woman", 0, "\"My husband Tony is missing! I don’t know what I’m going to do, I need someone to help me find him!\"")
	text_box.queue_cutscene("Moreau", 0, "\"What can you tell-\"")
	text_box.queue_cutscene("Woman", 0, "*frantically crying*")
	#QTE? text box game?
	# TEST
	# text_box.queue_cutscene("Quick!", 3, "")
	text_box.queue_cutscene("Moreau", 4, "\"What can you tell me about your-\"")
	text_box.queue_cutscene("Moreau", 4, "Husband")
	text_box.queue_cutscene("Moreau", 5, "Son")
	text_box.queue_cutscene("Moreau", 6, "Dog")
	text_box.queue_cutscene("Moreau", 7, "...")
	text_box.queue_cutscene("Moreau", 8, "...")
	text_box.queue_cutscene("Moreau", 1, "Correct answer is 1") # doesn't actually print this, only uses the number
	text_box.queue_cutscene("Woman", 0, "Tony is my husband! Were you even listening to me?!?!?!?") # only prints if fail
	# TEST
	# text_box.queue_cutscene("Moreau", 0, "\"What can you tell me about your husband Tony?\"")
	text_box.queue_cutscene("Woman", 0, "\"I think he got involved with some bad people. We run a restaurant together, and we’ve fallen on tough times lately.\"")
	text_box.queue_cutscene("Woman", -10, "\"He mentioned something about The Mafia being able to help us with our issues so that we can stay afloat.\"")
	text_box.queue_cutscene("Moreau", 0, "\" Is there anything else you can think of, did anyone have any reason to hurt your husband or your business?\"")
	text_box.queue_cutscene("Woman", 0, "\"No, not that I can think of, we are just honest business owners.\"")
	text_box.queue_cutscene("Moreau", 0, "\"Ah, I see... and what was your name, Mrs.-?\"")
	text_box.queue_cutscene("Mrs. Duval", 0, "\"Duval\"")
	text_box.queue_cutscene("Moreau", 2, "\"Alright, Mrs. Duval. I'll see what I can do to track down your husband and get to the bottom of this.\"")
	text_box.queue_cutscene("Moreau", 9, "\"...\"")
	text_box.queue_cutscene("Moreau", -11, "*Puffs cigarette*")
	text_box.queue_cutscene("Moreau", 1, "\"This is all too familiar. I better get down to the warehouses to see what he knows about this whole ordeal.\"")
	text_box.time_to_output = true
	
	await text_box.textevent
	$"../Cutscene/WomanEnter".play()
	
	await text_box.textevent
	ui_node.updateEvidence(1, true)
	
	await text_box.textevent
	$"../Cutscene/cigarettePuff".play()
	
	pass
