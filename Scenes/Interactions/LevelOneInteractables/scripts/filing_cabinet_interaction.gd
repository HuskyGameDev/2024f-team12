extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print("This is a Filing Cabinet!")
	

func _send_text():
	# enqueue text "* It's some filing cabinets. All the old paperwork and evidence is stored there *"
	pass
