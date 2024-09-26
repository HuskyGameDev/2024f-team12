extends CharacterBody2D

# Change this value to adjust how fast the character moves
var speed = 200

var moving = false
var movdir = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# Note: to make something happen in intervals of seconds,
# 		multiply the desired speed by the delta value
# 		i.e. speed = 10 * delta (10 pixels per second)
# 		diagram of how it works: https://imgur.com/a/NRzrdtG
func _process(delta: float) -> void:
	# User Input
	if(Input.is_anything_pressed()):
		if (Input.is_action_pressed("left") && (moving == false || movdir == 1)):
			position.x -= speed * delta
			moving = true
			movdir = 1
		elif (Input.is_action_pressed("right") && (moving == false || movdir == 2)):
			position.x += speed * delta
			moving = true
			movdir = 2
		elif (Input.is_action_pressed("down") && (moving == false || movdir == 3)):
			position.y += speed * delta
			moving = true
			movdir = 3
		elif (Input.is_action_pressed("up") && (moving == false || movdir == 4)):
			position.y -= speed * delta
			moving = true
			movdir = 4
		else:
			moving = false
			movdir = 0
		if (Input.is_action_just_pressed("primary_action")):
			print("Pew Pew")
	
