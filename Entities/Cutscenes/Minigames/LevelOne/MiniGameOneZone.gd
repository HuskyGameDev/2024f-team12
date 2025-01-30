extends Area2D

var hits = 0
var misses = 0
var hittable = false

@onready var target = $"../../Path2D/PathFollow2D/Target/TargetArea"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("skip") && hittable == true:
		hits += 1
		print("Hit!")
		print("Hitcount:")
		print(hits)
	elif Input.is_action_just_pressed("skip") && hittable == false:
		misses += 1
		print("Miss!")

func _on_area_entered(area: Area2D) -> void:
	hittable = true

func _on_area_exited(area: Area2D) -> void:
	hittable = false
