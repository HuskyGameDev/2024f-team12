extends CharacterBody2D

# Change this value to adjust how fast the character moves
var speed = 200

var moving = false
var movdir = 0
@onready var text_box = $"../Cutscene1"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Player Sprite".play("Idle_up") # Replace with function body.

func _process(delta: float) -> void:
	# User Input
	if(text_box.time_to_output == false):
		if(Input.is_anything_pressed()):
			var input_direction = Input.get_vector("left","right","up","down")
			velocity = input_direction * speed
			move_and_slide()
			
			#if (Input.is_action_just_pressed("primary_action")):
				#print("Pew Pew")
			
				
		# Movement Animations Shenanigans
		if(!Input.is_anything_pressed()):
			if(Input.is_action_just_released("down")):
				$"Player Sprite".play("Idle_down")
			if(Input.is_action_just_released("up")):
				$"Player Sprite".play("Idle_up")
			if(Input.is_action_just_released("left")):
				$"Player Sprite".play("Idle_left")
			if(Input.is_action_just_released("right")):
				$"Player Sprite".play("Idle_right")
			
		if(Input.is_action_pressed("down")):
			$"Player Sprite".play("walk_down")
		if(Input.is_action_pressed("up")):
			$"Player Sprite".play("walk_up")
		if(Input.is_action_pressed("left")):
			$"Player Sprite".play("walk_left")
		if(Input.is_action_pressed("right")):
			$"Player Sprite".play("walk_right")
