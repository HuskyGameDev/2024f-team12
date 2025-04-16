extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../ySort/Cutscene"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	
	if text_box.time_to_output == false:
		_send_text_second()

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
	
	text_box.time_to_output = true
