extends Control


func _on_master_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(-100,value)


func _on_check_box_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.


func _on_resolutions_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(320,180))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))
