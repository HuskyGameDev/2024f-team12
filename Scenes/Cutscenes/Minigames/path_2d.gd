extends Path2D

@onready var r = $PathFollow2D

var speed= 0.25

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	loop_movement(delta)

func loop_movement(delta):
	r.progress_ratio += delta*speed
	pass
