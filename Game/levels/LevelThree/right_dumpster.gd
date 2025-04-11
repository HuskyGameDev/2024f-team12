extends Node2D

@onready var text_box = $"../Cutscene"
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var dumpster = $"../TonyDumpster/AnimatedSprite2D"
@onready var cutsceneinteraction = $"../TonyCutscene"

var timesInteracted: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()

func _send_text():
	match timesInteracted:
		0:
			text_box.queue_text("???", "*Thump*")
			text_box.queue_text("???", "\"MMPH\"")
			text_box.queue_text("Moreau", "\"It sounds like there's someone in this dumpster!\"")
			interaction_area.action_name = "open"
		1:
			dumpster.frame = 1
			text_box.queue_text("???", "\"Oh, thank God somebody finally found me! Can you help me get out of here? I'm real beat up.\"")
			position.x = 918
			position.y = -187
			cutsceneinteraction.position.x = 912
			cutsceneinteraction.position.y = -285
	text_box.time_to_output = true
	timesInteracted += 1
	pass
