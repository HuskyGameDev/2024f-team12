extends Node2D

var file = 'res://Scenes/Cutscenes/Cutscene1/TextDisplayTest.txt'
var text_to_add = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	# load_file(file)
	$Dialogue.push_color(Color("white"))
	_say(FileAccess.get_file_as_string(file))

# func read_file(file):
	# var txt = File.new()
	# txt.open(file, File.READ)
	# var index = 1
	# while not txt.eof_reached():
	# 	var lin = txt.get_line()
	# 	lin += " "
	# 	print(lin + str(index))
	# 	
	# 	index += 1
	# txt.close()
	# return

func _say(text):
	text_to_add = text
	$Character_Delay.start()

#func get_text_file(path):
#	var text = FileAccess.open(path, FileAccess.READ)
#	while not text.eof_reached():
#		var lin = text.get_line()

func _on_char_delay_timeout():
	$Dialogue.add_text += text_to_add[0]
	text_to_add.erase(0,1)
	if text_to_add != "":
		$Character_Delay.start()
	else:
		print("done")
