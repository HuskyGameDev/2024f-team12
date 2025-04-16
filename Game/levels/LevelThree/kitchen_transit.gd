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
		if $"..".kitchenkey == false:
			text_box.queue_text("Moreau", "\"I need a key to get in. I probably shouldn't pick the lock with the officer right next to me\"")
			text_box.time_to_output = true
		else:
			dooropen.play()
			playernode.position.x = 472
			playernode.position.y = -249
			playernode.look_down()
	
	
