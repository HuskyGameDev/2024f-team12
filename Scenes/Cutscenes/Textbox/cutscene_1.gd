extends CanvasLayer

var CHAR_READ_RATE = 0.04

@onready var textbox_container = $TextboxContainer
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label
@onready var skip_promt = $TextboxContainer/MarginContainer/HBoxContainer/SkipText
@onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/StartSymbol
@onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/EndSymbol
@onready var speaker = $speaker

var startendsymbol = []
var speakers = []

var time_to_output = false
var blackscreen = false

@onready var tween = get_tree().create_tween().bind_node(self)

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

func _process(delta):
	match current_state:
		State.READY:
			if !text_queue.is_empty() && time_to_output == true:
				display_text()
		State.READ:
			if Input.is_action_just_pressed("skip"):
				tween.stop()
				label.visible_characters = label.text.length()
				tween.kill()
				end_symbol.text = startendsymbol.pop_front()
				change_state(State.FINISHED)
			pass
		State.FINISHED:
			if Input.is_action_just_pressed("skip"):
				change_state(State.READY)
				if text_queue.is_empty():
					hide_textbox()
					time_to_output = false
					blackscreen = false

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = " "
	label.text = ""
	skip_promt.text = ""
	speaker.text = ""
	textbox_container.hide()

func show_textbox():
	skip_promt.text = "Space to next"
	textbox_container.show()

func display_text():
	end_symbol.text = "  "
	start_symbol.text = startendsymbol.pop_front()
	speaker.text = speakers.pop_front()
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.visible_characters = -1
	change_state(State.READ)
	show_textbox()
	tween = get_tree().create_tween()
	tween.tween_property(label, "visible_characters", len(next_text), len(next_text) * CHAR_READ_RATE).from(0).finished
	tween.connect("finished", on_tween_finished)

func on_tween_finished():
	end_symbol.text = startendsymbol.pop_front()
	change_state(State.FINISHED)

func queue_text(speaker, queabletext, symbol):
	text_queue.push_back(queabletext)
	startendsymbol.push_back(symbol)
	startendsymbol.push_back(symbol)
	speakers.push_back(speaker)

func queue_cutscene(speaker, queabletext, symbol):
	blackscreen = true
	text_queue.push_back(queabletext)
	startendsymbol.push_back(symbol)
	startendsymbol.push_back(symbol)
	speakers.push_back(speaker)


func change_state(st):
	current_state = st
	match current_state:
		State.READY:
			print("Changing state to READY")
		State.READ:
			print("Changing state to READ")
		State.FINISHED:
			print("Changing state to FINISHED")
