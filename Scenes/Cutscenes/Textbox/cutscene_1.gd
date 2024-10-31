extends CanvasLayer

const CHAR_READ_RATE = 0.05

@onready var textbox_container = $TextboxContainer
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label
@onready var skip_promt = $TextboxContainer/MarginContainer/HBoxContainer/SkipPrompt

enum State 
{
	READY,
	READ,
	FINISHED
}

var current_state = State.READY
var text_queue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	print ("Starting State: State.READY")
	hide_textbox()
	queue_text("PLEASE WORK PLEASE WORK PLEASE WORK")

func _process(delta):
	match current_state:
		State.READY:
			if !text //Line where I left off

func hide_textbox():
	label.text = ""
	textbox_container.hide()
	
func show_textbox():
	textbox_container.show()

func add_text(next_text):
	label.text = next_text
	show_textbox()
	var tween = get_tree().create_tween()
	tween.tween_property(label, "visible_characters", 43, len(next_text) * CHAR_READ_RATE).from(0).finished
	#tween.connect("finished", on_tween_finished)
#func on_tween_finished():
	#end_symbol.text = "<-"
