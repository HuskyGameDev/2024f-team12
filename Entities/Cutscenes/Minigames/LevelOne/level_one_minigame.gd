extends Node2D

@onready var target = $Range/Rim/MiniGameOneZone

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func board_wipe():
	target.hits = 0
	target.misses = 0

func get_hits():
	return target.hits

func get_misses():
	return target.misses
