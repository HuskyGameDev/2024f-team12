class_name Game 
extends Node2D

@onready var screen_holder: Node2D = $ScreenHolder
#@onready var hud: Control = $HUD

var current_level:MyLevel

func _ready() -> void:
	# gives the lightManager autoload a reference to the light subview port
	#LightManager.get_light_subviewport()
	
	
	SceneManager.load_complete.connect(_on_level_loaded)
	SceneManager.load_start.connect(_on_load_start)
	SceneManager.scene_added.connect(_on_level_added)
	current_level = screen_holder.get_child(0) as MyLevel

func _on_level_loaded(level) -> void:
	if level is MyLevel:
		current_level = level

# shows how we can use this signal to make sure the loading screen stays on top
func _on_level_added(_level,_loading_screen) -> void:
	pass
	# keep loading screen on top
	if _loading_screen != null:
		var loading_parent: Node = _loading_screen.get_parent() as Node
		loading_parent.move_child(_loading_screen, loading_parent.get_child_count()-1)
	# HUD example
	#move_child(hud, get_child_count()-1) # uncomment to keep the HUD above the loading screen (like how it stays put in OG Zelda dungeons)

# shows how we can play with the HUD ordering to customize results, regardless of where SceneManager puts the loading screen
func _on_load_start(_loading_screen):
	pass
	# keep HUD on top of loading screen - uncomment below to keep HUD up top (see above)
#	_loading_screen.reparent(self)
#	move_child(_loading_screen,hud.get_index())
