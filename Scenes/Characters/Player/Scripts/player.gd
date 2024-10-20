extends CharacterBody2D

# Change this value to adjust how fast the character moves
var speed = 200

var moving = false
var movdir = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	# User Input
	if(Input.is_anything_pressed()):
		var input_direction = Input.get_vector("left","right","up","down")
		velocity = input_direction * speed
		move_and_slide()
		
		#if (Input.is_action_just_pressed("primary_action")):
			#print("Pew Pew")
	
