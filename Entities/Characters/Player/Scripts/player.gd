extends CharacterBody2D

# Change this value to adjust how fast the character moves
@export var speed = 2

var warehousep1done: bool = false
var moving: bool = false
var movdir = 0
@onready var footstep: AudioStreamPlayer = $Footstep as AudioStreamPlayer

var ui_node: Control

enum direction
{
	LEFT,
	RIGHT,
	UP,
	DOWN
}

var curdir = direction.UP

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ui_nodes = get_tree().get_nodes_in_group("ui")
	if ui_nodes.size() > 0:
		ui_node = ui_nodes[0] as Control
	else:
		ui_node = null 
	$"Player Sprite".play("Idle_up") # Replace with function body.

func _process(delta: float) -> void:
	# User Input
	if(ui_node.inDialogue == false):
		if(Input.is_anything_pressed()):
			var input_direction = Input.get_vector("left","right","up","down")
			velocity = input_direction * speed
			move_and_slide()
			
			#if (Input.is_action_just_pressed("primary_action")):
				#print("Pew Pew")
			
				
		# Movement Animations Shenanigans
		if(!Input.is_action_pressed("down") && !Input.is_action_pressed("up") && !Input.is_action_pressed("left") && !Input.is_action_pressed("right")):
			$Footstep.play()
			if(curdir == direction.DOWN):
				$"Player Sprite".play("Idle_down")
			if(curdir == direction.UP):
				$"Player Sprite".play("Idle_up")
			if(curdir == direction.LEFT):
				$"Player Sprite".play("Idle_left")
			if(curdir == direction.RIGHT):
				$"Player Sprite".play("Idle_right")
			
		if(Input.is_action_pressed("down")):
			$"Player Sprite".play("walk_down")
			curdir = direction.DOWN
		if(Input.is_action_pressed("up")):
			$"Player Sprite".play("walk_up")
			curdir = direction.UP
		if(Input.is_action_pressed("left") && !Input.is_action_pressed("down") && !Input.is_action_pressed("up")):
			$"Player Sprite".play("walk_left")
			curdir = direction.LEFT
		if(Input.is_action_pressed("right") && !Input.is_action_pressed("down") && !Input.is_action_pressed("up")):
			$"Player Sprite".play("walk_right")
			curdir = direction.RIGHT
	else:
		$Footstep.stop()
		if(curdir == direction.DOWN):
			$"Player Sprite".play("Idle_down")
		if(curdir == direction.UP):
			$"Player Sprite".play("Idle_up")
		if(curdir == direction.LEFT):
			$"Player Sprite".play("Idle_left")
		if(curdir == direction.RIGHT):
			$"Player Sprite".play("Idle_right")
	

func look_down():
	curdir = direction.DOWN
	$"Player Sprite".play("Idle_down")

func _toggleWarehouse():
	if warehousep1done:
		warehousep1done = false
	else:
		warehousep1done = true

func _getWarehouse():
	return warehousep1done


func loud_steps():
	footstep.set_volume_db(10)
	footstep.pitch_scale = 0.85
