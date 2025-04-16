extends Node2D

@onready var text_box = $"../Cutscene"
@onready var interaction_area: InteractionArea = $InteractionArea
@onready var playernode: CharacterBody2D = $"../Player"
@onready var dooropen: AudioStreamPlayer2D = $"../DoorSound"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		if $"..".alleydoorunlocked == false:
			$"..".alleydoorunlocked = true
			text_box.lockpickmode = true
			text_box.queue_cutscene("Moreau", 0, "\"Looks like the door to the alleyway is locked, maybe there's evidence out there.\"")
			text_box.time_to_output = true
		else:
			dooropen.play()
			playernode.position.x = 984
			playernode.position.y = -282
			playernode.look_down()
			$"../IndoorRain".stop()
			$"../OutdoorRain".play()
	
