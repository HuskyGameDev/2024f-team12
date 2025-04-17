extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../ySort/Cutscene"

var ui_node: Control

func _ready():
	var ui_nodes = get_tree().get_nodes_in_group("ui")
	if ui_nodes.size() > 0:
		ui_node = ui_nodes[0] as Control
	else:
		ui_node = null 
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	var visitation: bool = false
	if text_box.level2cutscene[1] == 1:
		visitation = true
	if text_box.time_to_output == false:
		if visitation:
			_send_text_second()
		else:
			
			_send_text_first()

func _send_text_second():
	text_box.set_cutscene(5)
	text_box.queue_cutscene("", 1, "*Moreau slowly enters the office...*")
	text_box.queue_cutscene("???", 2, "\"Why the hell are you back here, Moreau? I gave you your info.\"")
	text_box.queue_cutscene("Moreau", 0, "\"I never thought you'd truly have the guts to do it... Never thought you'd make me have to set things right...\"")
	text_box.queue_cutscene("???", 0, "\"Have to do what? You know that what I had the boys do was just a bit of business. You just got a little too nosy for your own good, Leo...\"")
	text_box.queue_cutscene("Moreau", 0, "\"Oh, I got a little nosy, huh? That's really funny, you got your damn nose in every aspect of this city!\"")
	text_box.queue_cutscene("Moreau", 0, "\"Hell, your influence runs so deep, I wouldn't be able to find an honest job here even if my life depended on it.\"")
	text_box.queue_cutscene("???", 0, "\"Well Leo... maybe your life does depend on it. Nobody, and I mean NOBODY comes into my work, and talks to me like THAT!\"")
	text_box.queue_cutscene("???", 0, "*Cough*")
	text_box.queue_cutscene("???", 0, "\"But, just this once I am willing to make an exception, considering our mutual business relationship.\"")
	text_box.queue_cutscene("Moreau", 0, "\"...\"")
	text_box.queue_cutscene("???", 0, "\"What do ya say Leo? We forget all this ever happened, and go on living life in this messed up city?\"")
	text_box.queue_cutscene("Moreau", 0, "\"...\"")
	text_box.queue_cutscene("???", 0, "\"Y’know I never give you a bad offer Leo. I’ve always valued what we’ve had, what you’ve done. The renowned detective, LEO MOREAU!\"")
	text_box.queue_cutscene("Moreau", 0, "\"She was special, you know... only she and my closest friends could call me Leo. And, if I’m being honest... I intend to keep it that way.\"")
	text_box.queue_cutscene("", -1, "*Two guns were drawn in that room. Answered with a single, echoing 'bang'.*")


func _send_text_first():
	var evidence = $".."._GetEvidence()
	
	text_box.set_cutscene(3)
	text_box.queue_cutscene("", 1, "*Moreau opens the door*")
	#screen shakes? Woman enters
	
	text_box.queue_cutscene("???", 2, "\"What are you doing here this time?\"")
	text_box.queue_cutscene("Moreau", 0, "\"I need some information about a lead I got this afternoon.\"")
	text_box.queue_cutscene("???", 0, "\"And what's in it for me, Moreau?\"")
	#text_box.queue_cutscene("Moreau", 0, "\"I THINK THIS IS THE EVIDENCE, STILL NOT SURE HOW TO SET IT UP THOUGH\"")
	#text_box.queue_cutscene("???", 0, "*There will be multiple choice here once we figure out the evidence system*")
	
	# TEST
	text_box.queue_cutscene("Moreau", 4, "\"I have something that might pursuade you.\"")
	if evidence[0] == 1:
		text_box.queue_cutscene("Moreau", 4, "Tax fraud")
	else:
		text_box.queue_cutscene("Moreau", 4, "...")
	
	if evidence[1] == 1:
		text_box.queue_cutscene("Moreau", 5, "Child support")
	else:
		text_box.queue_cutscene("Moreau", 5, "...")
	
	if evidence[2] == 1:
		text_box.queue_cutscene("Moreau", 6, "Drug evidence")
	else:
		text_box.queue_cutscene("Moreau", 6, "...")
	
	if evidence[3] == 1:
		text_box.queue_cutscene("Moreau", 7, "Dirty money")
	
	text_box.queue_cutscene("Moreau", 8, "...")
	
	if evidence[0] == 1:
		text_box.queue_cutscene("Moreau", 1, "Correct answer is 1") # doesn't actually print this, only uses the number
	elif evidence[1] == 1:
		text_box.queue_cutscene("Moreau", 2, "Correct answer is 2") # doesn't actually print this, only uses the number
	else:
		text_box.queue_cutscene("Moreau", 99, "No good evidence found yet") # doesn't actually print this, only uses the number
	
	text_box.queue_cutscene("Woman", 0, "Ha! You think I care about that? Scram!") # only prints if fail
	# TEST
	text_box.queue_cutscene("???", 0, "\"Fine, I'll help you out. What do you want?\"")
	text_box.queue_cutscene("Moreau", 0, "\"So what can you tell me about a Tony Duval? He came up missing a couple days ago.\"")
	text_box.queue_cutscene("???", -10, "\"Ah, him... my boys have been having some trouble with *The Gang* lately.\"")
	text_box.queue_cutscene("???", 0, "\"I know we've lost three boys in the past to their turf wars, and that's just- that's not the point.\"")
	text_box.queue_cutscene("???", 0, "\"If you were really gonna go looking, I'd start with the damn gang.\"")
	text_box.queue_cutscene("Moreau", 0, "\"I appreciate the help… and if you wouldn’t mind, it would be awfully convenient to be able to just walk in next time.\"")
	text_box.queue_cutscene("???", 2, "\"Yeah, yeah. Get outta here!\"")
	text_box.queue_cutscene("Moreau", 9, "*Leaves through fire exit*")
	text_box.queue_cutscene("Moreau", 1, "\"I probably shouldn’t just take his word for it, I need to go check out this restaurant to see what actually happened.\"")
	text_box.time_to_output = true
	
	await text_box.textevent
	ui_node.evidencefound[3] = true
	
	pass
