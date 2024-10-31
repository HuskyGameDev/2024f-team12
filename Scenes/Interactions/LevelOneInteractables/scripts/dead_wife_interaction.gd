extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print("This is a Picture!")
	

func _send_text():
	# enqueue text "* It's a picture of a woman, resting on the only dustless surface in the office *"
	# enqueue text "I know you're out there somewhere."
	pass
