extends Node2D

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	print("This is a Cork Board!")
	

func _send_text():
	# enqueue text "* It's a cork board with lots of old cases. *"
	# enqueue text "What a year it's been..."
	pass
