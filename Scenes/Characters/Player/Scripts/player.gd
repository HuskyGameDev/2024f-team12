extends CharacterBody2D

# Change this value to adjust how fast the character moves
var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# Note: to make something happen in intervals of seconds,
# 		multiply the desired speed by the delta value
# 		i.e. speed = 10 * delta (10 pixels per second)
# 		diagram of how it works: https://imgur.com/a/NRzrdtG
func _process(delta: float) -> void:
	# movement
	var direction = Input.get_vector("left","right","up","down")
	position += direction * speed * delta
	
	# interaction
	if (Input.is_action_just_pressed("primary_action")):
		print("Pew Pew")
	
