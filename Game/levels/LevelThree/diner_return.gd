extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var playernode: CharacterBody2D = $"../Player"
@onready var dooropen: AudioStreamPlayer2D = $"../DoorSound"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	dooropen.play()
	playernode.position.x = 520
	playernode.position.y = 166
	playernode.look_down()
