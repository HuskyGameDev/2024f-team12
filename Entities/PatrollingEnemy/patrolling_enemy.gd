extends CharacterBody2D

@export var vision_renderer: Polygon2D
@export var alert_color: Color

@export_group("Rotation")
@export var is_rotating = false
@export var rotation_speed = 0.1
@export var rotation_angle = 90

@export_group("Movement")
@export var move_on_path: PathFollow2D
@export var movement_speed = 0.1
@onready var pos_start = position.x

@onready var original_color = vision_renderer.color if vision_renderer else Color.WHITE
@onready var rot_start = rotation


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var text_box := $"../ySort/Cutscene"

@export var sceneToUnload: Node


var isDetected: bool = false
var timeToSwitch: bool = false

var _position_last_frame := Vector2()
var _cardinal_direction := 0

func _ready():
	sceneToUnload = get_parent()


func _process(delta):
	if isDetected && text_box.text_queue.is_empty() && !timeToSwitch && !text_box.time_to_output:
		timeToSwitch = true
		_switch_scenes()






func _switch_scenes():
	#print("switching")
	var game_node: Game = get_tree().get_nodes_in_group("game")[0] as Game
	SceneManager.swap_scenes("res://Game/levels/LevelTwo/LevelTwo.tscn", game_node.screen_holder, sceneToUnload , "fade_to_dark")


func _on_vision_cone_area_body_entered(body: Node2D) -> void:
	# print("%s is seeing %s" % [self, body])
	vision_renderer.color = alert_color
	if !isDetected:
		print("Moreau Detected")
		isDetected = true
		_player_detected()

func _on_vision_cone_area_body_exited(body: Node2D) -> void:
	# print("%s stopped seeing %s" % [self, body])
	vision_renderer.color = original_color

func _physics_process(delta: float) -> void:
	if is_rotating:
		rotation = rot_start + sin(Time.get_ticks_msec()/1000. * rotation_speed) * deg_to_rad(rotation_angle/2.)
	if move_on_path:
		move_on_path.progress += movement_speed
		global_position = move_on_path.position
		if move_on_path.progress_ratio >= 0.5:
			rotation = PI
			sprite.flip_v = true
		else:
			rotation = 0
			sprite.flip_v = false
		#rotation = move_on_path.rotation
	
	#region Direction
		# Get motion vector between previous and current position
	var motion = position - _position_last_frame
	# If the node actually moved, we'll recompute its direction.
	# If it didn't, we'll just the last known one.
	if motion.length() > 0.0001:
		# Now if you want a value between N.S.W.E,
		# you can use the angle of the motion.
		# I came up with this formula last time I needed it:
		_cardinal_direction = int(4.0 * (motion.rotated(PI / 4.0).angle() + PI) / TAU)
	# And now you have it!
	# You can even use it with an array since it's like an index
	match _cardinal_direction:
		0:
			print("West")
		1:
			print("North")
		2:
			print("East")
		3:
			print("South")

	# Remember our current position for next frame
	_position_last_frame = position
	
	#endregion
	
	




func _player_detected():
	# This is the function that
	
	text_box.queue_text("Goony","HEY! What do you think you're doin in here?!")
	text_box.queue_text("Moreau", "Uh Oh")
	text_box.time_to_output = true
	
	#await text_box.text_queue.is_empty()
	
	
	
	pass
