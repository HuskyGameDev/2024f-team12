extends CanvasLayer

const CHAR_READ_RATE = 0.05

@onready var textbox_container = $TextboxContainer
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_textbox()
	add_text("PLEASE WORK PLEASE WORK PLEASE WORK")

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
