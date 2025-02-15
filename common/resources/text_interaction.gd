extends Sprite2D
class_name TextInteraction

@onready var interaction_area: InteractionArea = $InteractionArea
@onready var text_box = $"../Cutscene"
@onready var blackscreen = $"../blackscreen"

@export var resource: InteractionInfo

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _on_interact():
	if text_box.time_to_output == false:
		_send_text()

func _send_text():
	for i in resource.text.size():
		var character: String
		match resource.speaking_character[i]:
			0:
				character = "Moreau"
			1:
				character = ""
		
		
		text_box.queue_text(character,resource.text[i])
	text_box.time_to_output = true
	
	
