extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../ySort/Cutscene"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()


func _send_text():
	text_box.set_cutscene(1)
	text_box.queue_cutscene("", 1, "*Moreau opens the door*")
	#screen shakes? Woman enters
	
	text_box.queue_cutscene("???", 2, "\"What are you doing here this time?\"")
	text_box.queue_cutscene("Moreau", 0, "\"I need some information about a lead I got this afternoon.\"")
	text_box.queue_cutscene("???", 0, "\"And what's in it for me, Moreau?\"")
	text_box.queue_cutscene("Moreau", 0, "\"I THINK THIS IS THE EVIDENCE, STILL NOT SURE HOW TO SET IT UP THOUGH\"")
	text_box.queue_cutscene("???", 0, "*There will be multiple choice here once we figure out the evidence system*")
	
	# TEST
	#text_box.queue_cutscene("Moreau", 4, "\"What can you tell me about your-\"")
	#text_box.queue_cutscene("Moreau", 4, "Husband")
	#text_box.queue_cutscene("Moreau", 5, "Son")
	#text_box.queue_cutscene("Moreau", 6, "Dog")
	#text_box.queue_cutscene("Moreau", 7, "...")
	#text_box.queue_cutscene("Moreau", 8, "...")
	#text_box.queue_cutscene("Moreau", 1, "Correct answer is 1") # doesn't actually print this, only uses the number
	#text_box.queue_cutscene("Woman", 0, "Tony is my husband! Were you even listening to me?!?!?!?") # only prints if fail
	# TEST
	text_box.queue_cutscene("Moreau", 0, "\"So what can you tell me about a Tony Duval? He came up missing a couple days ago.\"")
	text_box.queue_cutscene("???", 0, "\"Ah, him... my boys have been having some trouble with *The Gang* lately.\"")
	text_box.queue_cutscene("???", 0, "\"I know we've lost three boys in the past to their turf wars, and that's just- that's not the point.\"")
	text_box.queue_cutscene("???", 0, "\"If you were really gonna go looking, I'd start with the damn gang.\"")
	text_box.queue_cutscene("Moreau", 0, "\"I appreciate the help… and if you wouldn’t mind, it would be awfully convenient to be able to just walk in next time.\"")
	text_box.queue_cutscene("???", 2, "\"Yeah, yeah. Get outta here!\"")
	text_box.queue_cutscene("Moreau", 1, "*Leaves through fire exit*")
	text_box.queue_cutscene("Moreau", 0, "\"I probably shouldn’t just take his word for it, I need to go check out this restaurant to see what actually happened.\"")
	text_box.time_to_output = true
	pass
