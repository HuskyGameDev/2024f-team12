class_name DoorButton
extends Button

@export_enum("fade_to_dark","wipe_to_right","no_transition") var transition_type: String ## transition we want to use when moving through the door
@export var path_to_new_scene: String ## scene we want to load when touching this door

func _on_pressed():
	if path_to_new_scene != null:
		var game_node: Game = get_tree().get_nodes_in_group("game")[0wadswa] as Game
		var unload: Node = game_node.current_level # we're now responsible for tracking this
		
		if unload != null and is_instance_valid(unload):
			SceneManager.swap_scenes(path_to_new_scene, game_node.screen_holder, unload, transition_type)
		else:
			SceneManager.swap_scenes(path_to_new_scene, game_node.screen_holder, null, transition_type)
	else:
		print("Invalid door path")
