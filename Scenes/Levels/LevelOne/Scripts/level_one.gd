extends Node2D

@onready var text_box = $Cutscene1
@onready var blackscreen = $blackscreen

# Main script for the first level of the game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if text_box.blackscreen == true && blackscreen.z_index == 0:
		blackscreen.z_index = 30
	elif text_box.blackscreen == false && blackscreen.z_index == 30:
		blackscreen.z_index = 0
	pass
