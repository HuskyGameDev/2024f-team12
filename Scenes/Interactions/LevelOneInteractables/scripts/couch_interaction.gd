extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print("This is a Couch!")
	

func _send_text():
	# enqueue text "* it's an old client sofa *"
	# enqueue text "I really need to get a new couch for the office..."
	pass
