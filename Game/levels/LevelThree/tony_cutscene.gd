extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../Cutscene"

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()


func _send_text():
	text_box.set_cutscene(4)
	text_box.queue_cutscene("Moreau", 1, "\"How’d you end up in this state?\"")
	text_box.queue_cutscene("???", 2, "\"Oh, thank goodness! I was just going about my daily duties at the restaurant when these mafia thugs jumped me taking out the trash.\"")
	text_box.queue_cutscene("Moreau", 0, "\"Oh, so you must be Mr. Tony Duval?\"")
	text_box.queue_cutscene("Tony", 0, "\"At your service\"")
	text_box.queue_cutscene("Moreau", 0, "\"So, why do you think- wait, did you say MAFIA thugs???\"")
	text_box.queue_cutscene("Tony", 0, "\"Oh yeah, you bet it was them.\"")
	text_box.queue_cutscene("Tony", 0, "\"The damn gangsters just haven’t left me alone since I took that loan from their boss to keep the restaurant going.\"")
	text_box.queue_cutscene("Moreau", 0, "\"Is that the only reason that they would have to hurt you or your wife?\"")
	text_box.queue_cutscene("Tony", 0, "\"Oh Mr. Detective, they wouldn’t have any reason to hurt my dear wife. That’s exactly why I ended up in the garbage\"")
	text_box.queue_cutscene("Moreau", 0, "\"So you truly think this is just because you owed them some money?\"")
	text_box.queue_cutscene("Tony", 0, "\"Well... “some money” might be understating it. I asked for $10,000...\"")
	text_box.queue_cutscene("Tony", 0, "\"I figured if I could upgrade some things around here it might help business on the repaying side of things.\"")
	text_box.queue_cutscene("Tony", 0, "\"With this economy though, it’s only been downhill for the past couple months.\"")
	text_box.queue_cutscene("Moreau", 0, "\"I see, so that’s what this has been about the whole time then, dirty money.\"")
	text_box.queue_cutscene("Moreau", 0, "\"I guess that makes the case your wife brought to me pretty open and shut.\"")
	text_box.queue_cutscene("Tony", 0, "\" I can see how you would think that Mr. Detective, but I have a hunch that this is far from over.\"")
	text_box.queue_cutscene("Tony", 0, "\"When I started dealing with the mafia boss, he told me about all the dealings that they get up to around the city.\"")
	text_box.queue_cutscene("Tony", 0, "\"He mentioned that aside from loan sharking, they will do just about anything for a buck or favor.\"")
	text_box.queue_cutscene("Tony", 0, "\"He told me that about four months ago he even had to send some of his boys out to kill some cops wife…\"")
	text_box.queue_cutscene("Tony", 0, "\"Said he was \'snooping around too much for business\' or something like that.\"")
	text_box.queue_cutscene("Tony", 0, "\"That’s part of the reason that my wife and I feared so much for our lives while we were caught up in the whole mess of it.\"")
	text_box.queue_cutscene("Moreau", 0, "\"...\"")
	text_box.queue_cutscene("Tony", 0, "\" I mean, who wouldn’t be intimidated by one of the strongest forces of the city underworld?\"")
	text_box.queue_cutscene("Moreau", 0, "\"...\"")
	text_box.queue_cutscene("Tony", 0, "\"It’s really pretty crazy looking back on- erm… are you alright there Mr. Detective?\"")
	text_box.queue_cutscene("Moreau", -1, "\"That BASTARD!\"")
	text_box.queue_cutscene("", 0, "\"I ALWAYS KNEW THERE WAS MORE\"")
	text_box.queue_cutscene("", 0, "\"IT JUST COULDN'T BE THAT SIMPLE\"")
	text_box.queue_cutscene("", 0, "\"COULDN'T BE THAT EASY\"")
	text_box.queue_cutscene("", 0, "\"COULDN'T BE THE WAY IT ENDED\"")
	text_box.queue_cutscene("", 0, "\"IT JUST COULDN'T BE...\"")
	text_box.time_to_output = true
	pass
