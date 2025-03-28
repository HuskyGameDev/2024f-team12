extends CanvasLayer

var CHAR_READ_RATE = 0.04

#NOTE
# 1. clamp width of text box?
# 2. change format of name to allow for two line names?


@onready var textbox_container = $TextboxContainer
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label
@onready var skip_promt = $TextboxContainer/MarginContainer/HBoxContainer/VBoxContainer/SkipText
# @onready var LOM = $LOM
@onready var multichoice = $MarginContainer
@onready var b1 = $MarginContainer/MarginContainer/VBoxContainer/Button
@onready var b2 = $MarginContainer/MarginContainer/VBoxContainer/Button2
@onready var b3 = $MarginContainer/MarginContainer/VBoxContainer/Button3
@onready var b4 = $MarginContainer/MarginContainer/VBoxContainer/Button4

@onready var speaker = $TextboxContainer/MarginContainer/HBoxContainer/VBoxContainer/Speaker

var speakerone = false
var speakertwo = false

var speakers = []
var speakerson = []

var curspeaker = ""
var curcutscene = 0 # Number is based on order of the following arrays
var level1cutscene = [0, 0, 0] # if active, if succeeded, num of fails
var level1exit = [0, 0, 0] # if active, if succeeded, num of fails
var level2cutscene = [0, 0, 0] # if active, if succeeded, num of fails 

var time_to_output = false
var blackscreen = false
var minigame = false
var minigamevisible = false
var multiplechoice = false
var mcv = true
var correctanswer = 0
var buttonjustpressed = false
var buttonpressed = -5
var waspeaker = "nobody"
var waspeakerson = 0
var watext = "blank"
var wathistry = false

var ui_node: Control


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
	
	ui_node = get_tree().get_nodes_in_group("ui")[0] as Control
	
	hide_textbox()
	# LOM.hide()

func _process(delta):
	match current_state:
		State.READY:
			if !text_queue.is_empty() && time_to_output == true:
				ui_node.inDialogue = true
				display_text()
			
		State.READ:
			if Input.is_action_just_pressed("skip"):
				tween.stop()
				label.visible_characters = label.text.length()
				tween.kill()
				if text_queue.is_empty():
					skip_promt.text = "Space to exit"
				else:
					skip_promt.text = "Space to cont"
				change_state(State.FINISHED)
			pass
		State.FINISHED:
			if curspeaker != "":
				curspeaker = ""
			if Input.is_action_just_pressed("skip") && minigame == false && multiplechoice == false:
				change_state(State.READY)
				if text_queue.is_empty():
					updatecutscene()
					wathistry = false
					curcutscene = 0
					hide_textbox()
					time_to_output = false
					blackscreen = false
					speakerone = false
					speakertwo = false
					ui_node.inDialogue = false
			# if minigame == true && minigamevisible == false:
				# LOM.show()
				# LOM.board_wipe()
				# minigamevisible = true
			# if minigame == true && LOM.get_hits() == 2:
				# LOM.hide()
				# minigame = false
				# minigamevisible = false
				# change_state(State.READY)
			if multiplechoice == true && mcv == false:
				mcv = true
				multichoice.show()
				
			if buttonjustpressed == true && buttonpressed == correctanswer:
				multichoice.hide()
				buttonjustpressed = false
				multiplechoice = false
				mcv = false
				correctanswer = 0
				buttonpressed = -5
				# speakerson.pop_front()
				# speakers.pop_front()
				# text_queue.pop_front()
				change_state(State.READY)
			if buttonjustpressed == true && buttonpressed != correctanswer:
				wathistry = true
				multichoice.hide()
				buttonjustpressed = false
				multiplechoice = false
				mcv = false
				correctanswer = 0
				buttonpressed = -5
				speakerson.clear()
				speakers.clear()
				text_queue.clear()
				speakerson.push_back(waspeakerson)
				speakers.push_back(waspeaker)
				text_queue.push_back(watext)
				change_state(State.READY)
			

func hide_textbox():
	# if minigamevisible:
		# LOM.hide()
	if mcv:
		multichoice.hide()
		mcv = false
	label.text = ""
	skip_promt.text = ""
	speaker.text = ""
	textbox_container.hide()

func show_textbox():
	skip_promt.text = "Space to skip"
	textbox_container.show()

func display_text():
	var spk = speakerson.pop_front()
	if spk == null:
		spk = 0
	if skip_promt.hidden:
		skip_promt.show()
	if spk < 3:
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
	if spk == 9:
		curspeaker = ""
	else:
		curspeaker = speaker.text
	
	
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.visible_characters = -1
	change_state(State.READ)
	show_textbox()
	tween = get_tree().create_tween()
	tween.tween_property(label, "visible_characters", len(next_text), len(next_text) * CHAR_READ_RATE).from(0).finished
	tween.connect("finished", on_tween_finished)
	
	if spk >= 4 && spk <= 7:
		place_buttons()
		multiplechoice = true

func on_tween_finished():
	if text_queue.is_empty():
		skip_promt.text = "Space to exit"
	elif minigame:
		pass
	else:
		skip_promt.text = "Space to cont"
	change_state(State.FINISHED)

func queue_text(speaker, queabletext):
	text_queue.push_back(queabletext)
	speakers.push_back(speaker)


#note for 'shown', if 0 nothing happens, if 1 toggles speakerone
#   if 2, toggles speakertwo
#   if 3, activates minigame
#   if 4-7, sets respective buttons
func queue_cutscene(speaker, shown, queabletext):
	blackscreen = true
	text_queue.push_back(queabletext)
	speakers.push_back(speaker)
	speakerson.push_back(shown)

func adjust_button_box():
	var boxfinalsize = 0
	if b1.visible:
		var button_size = b1.get_minimum_size()
		boxfinalsize += button_size.y
	if b2.visible:
		var button_size = b2.get_minimum_size()
		boxfinalsize += button_size.y
	if b3.visible:
		var button_size = b3.get_minimum_size()
		boxfinalsize += button_size.y
	if b4.visible:
		var button_size = b4.get_minimum_size()
		boxfinalsize += button_size.y

func place_buttons():
	var curbutt = speakerson.pop_front()
	speakers.pop_front()
	while curbutt != 8:
		if curbutt == 4:
			b1.show()
			b1.text = text_queue.pop_front()
		if curbutt == 5:
			b2.show()
			b2.text = text_queue.pop_front()
		if curbutt == 6:
			b3.show()
			b3.text = text_queue.pop_front()
		if curbutt == 7:
			b4.show()
			b4.text = text_queue.pop_front()
		speakers.pop_front()
		curbutt = speakerson.pop_front()
	text_queue.pop_front()
	text_queue.pop_front()
	speakers.pop_front()
	curbutt = speakerson.pop_front()
	correctanswer = curbutt
	multichoice.show()
	adjust_button_box()
	
	waspeakerson = speakerson.pop_front()
	waspeaker = speakers.pop_front()
	watext = text_queue.pop_front()


func _on_button_pressed() -> void:
	$Click.play()
	buttonjustpressed = true
	buttonpressed = 1

func _on_button_2_pressed() -> void:
	$Click.play()
	buttonjustpressed = true
	buttonpressed = 2

func _on_button_3_pressed() -> void:
	$Click.play()
	buttonjustpressed = true
	buttonpressed = 3

func _on_button_4_pressed() -> void:
	$Click.play()
	buttonjustpressed = true
	buttonpressed = 4

func wrong_answer():
	pass

func change_state(st):
	current_state = st
	match current_state:
		State.READY:
			print("Changing state to READY")
		State.READ:
			print("Changing state to READ")
		State.FINISHED:
			print("Changing state to FINISHED")

func set_cutscene(cutname):
	if cutname == 1:
		level1cutscene[0] = 1
		curcutscene = 1
	
	if cutname == 2:
		level1exit[0] = 1
		curcutscene = 2
	
	if cutname == 3:
		level2cutscene[0] = 1
		curcutscene = 3

func updatecutscene():
	var success = 2
	if wathistry == false:
		success = 1
	
	match curcutscene:
		1:
			level1cutscene[success] += 1
			level1cutscene[0] = 0
		2:
			level1exit[success] += 1
			level1exit[0] = 0
		3:
			level1cutscene[success] += 1
			level1cutscene[0] = 0
