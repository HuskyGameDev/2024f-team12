extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../Cutscene1"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()

func _send_text():
	text_box.queue_cutscene("", 0, "*It's a massive desk, and is suprisingly cluttered.*")
	text_box.queue_cutscene("Moreau", 1, "\"Man, I've gotta work on cleaning this place up.\"")
	#screen shakes? Woman enters
	text_box.queue_cutscene("Woman", 2, "\"Are you detective Moreau?!? I need your help!\"")
	text_box.queue_cutscene("Moreau", 0, "\"Indeed, I'm Moreau. What can I do for you?\"")
	text_box.queue_cutscene("Woman", 0, "\"My husband Tony is missing! I don’t know what I’m going to do, I need someone to help me find him!\"")
	text_box.queue_cutscene("Moreau", 0, "\"What can you tell-\"")
	text_box.queue_cutscene("Woman", 0, "*frantically crying*")
	#QTE? text box game?
	# TEST
	# text_box.queue_cutscene("Quick!", 3, "")
	# TEST
	text_box.queue_cutscene("Moreau", 0, "\"What can you tell me about your husband Tony?\"")
	text_box.queue_cutscene("Woman", 0, "\"I think he got involved with some bad people. We run a restaurant together, and we’ve fallen on tough times lately.\"")
	text_box.queue_cutscene("Woman", 0, "\"He mentioned something about The Mafia being able to help us with our issues so that we can stay afloat.\"")
	text_box.queue_cutscene("Moreau", 0, "\" Is there anything else you can think of, did anyone have any reason to hurt your husband or your business?\"")
	text_box.queue_cutscene("Woman", 0, "\"No, not that I can think of, we are just honest business owners.\"")
	text_box.queue_cutscene("Moreau", 0, "\"Ah, I see... and what was your name, Mrs.-?\"")
	text_box.queue_cutscene("Mrs. Placehol", 0, "\"Placeholder\"")
	text_box.queue_cutscene("Moreau", 0, "\"Alright, Mrs.Placeholder. I'll see what I can do to track down your husband and get to the bottom of this.\"")
	text_box.queue_cutscene("Moreau", 2, "*Possible thought or connection to exposition*")
	text_box.time_to_output = true
	pass
