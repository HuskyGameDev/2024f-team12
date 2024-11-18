extends CanvasLayer

var CHAR_READ_RATE = 0.04

#NOTE
# 1. clamp width of text box?
# 2. change format of name to allow for two line names?




@onready var textbox_container = $TextboxContainer
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label
@onready var skip_promt = $TextboxContainer/MarginContainer/VBoxContainer/SkipText
@onready var LOM = $LOM

@onready var speaker = $TextboxContainer/MarginContainer/VBoxContainer/speaker

var speakerone = false
var speakertwo = false

var speakers = []
var speakerson = []

var time_to_output = false
var blackscreen = false
var minigame = false
var minigamevisible = false

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
	LOM.hide()

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
				if text_queue.is_empty():
					skip_promt.text = "Space to exit"
				else:
					skip_promt.text = "Space to continue"
				change_state(State.FINISHED)
			pass
		State.FINISHED:
			if Input.is_action_just_pressed("skip") && minigame == false:
				change_state(State.READY)
				if text_queue.is_empty():
					hide_textbox()
					time_to_output = false
					blackscreen = false
					speakerone = false
					speakertwo = false
			if minigame == true && minigamevisible == false:
				LOM.show()
				LOM.board_wipe()
				minigamevisible = true
			if minigame == true && LOM.get_hits() == 2:
				LOM.hide()
				minigame = false
				minigamevisible = false
				change_state(State.READY)

func hide_textbox():
	if minigamevisible:
		LOM.hide()
	label.text = ""
	skip_promt.text = ""
	speaker.text = ""
	textbox_container.hide()

func show_textbox():
	skip_promt.text = "Space to skip"
	textbox_container.show()

func display_text():
	var spk = speakerson.pop_front()
	if skip_promt.hidden:
		skip_promt.show()
	if spk != 3:
		skip_promt.text = "Space to skip"
	else:
		skip_promt.hide()
	speaker.text = speakers.pop_front()
	if spk == 1:
		if speakerone == true:
			speakerone = false
		else:
			speakerone = true
	if spk == 2:
		if speakertwo == true:
			speakertwo = false
		else:
			speakertwo = true
	if spk == 3:
		minigame = true
	
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.visible_characters = -1
	change_state(State.READ)
	show_textbox()
	tween = get_tree().create_tween()
	tween.tween_property(label, "visible_characters", len(next_text), len(next_text) * CHAR_READ_RATE).from(0).finished
	tween.connect("finished", on_tween_finished)

func on_tween_finished():
	if text_queue.is_empty():
		skip_promt.text = "Space to exit"
	elif minigame:
		pass
	else:
		skip_promt.text = "Space to continue"
	change_state(State.FINISHED)

func queue_text(speaker, queabletext):
	text_queue.push_back(queabletext)
	speakers.push_back(speaker)

#note for 'shown', if 0 nothing happens, if 1 toggles speakerone
#   if 2, toggles speakertwo
func queue_cutscene(speaker, shown, queabletext):
	blackscreen = true
	text_queue.push_back(queabletext)
	speakers.push_back(speaker)
	speakerson.push_back(shown)


func change_state(st):
	current_state = st
	match current_state:
		State.READY:
			print("Changing state to READY")
		State.READ:
			print("Changing state to READ")
		State.FINISHED:
			print("Changing state to FINISHED")
