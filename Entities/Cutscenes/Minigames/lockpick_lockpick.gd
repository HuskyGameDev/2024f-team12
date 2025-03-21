extends CharacterBody2D

var playtime = false
var locset = false

func _process(delta: float) -> void:
	if playtime == true:
		if locset == false:
			position.x = 255
			position.y = 96
			locset = true
		var direction = Input.get_vector("left","right","up","down")
		velocity = direction * 50
		move_and_slide()
	
