class_name SettingsTabContainer

extends Control


@onready var tab_container: TabContainer = $TabContainer as TabContainer


signal exit_options_menu


func _process(delta):
	option_menu_input()


func change_tab(tab : int) -> void:
	tab_container.set_current_tab(tab)


func option_menu_input() -> void:
	if Input.is_action_just_pressed("right") or Input.is_action_just_pressed("ui_right"):
		if tab_container.current_tab >= tab_container.get_tab_count() - 1:
			change_tab(0)
			return
		
		var next_tab = tab_container.current_tab + 1
		change_tab(next_tab)
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("ui_left"):
		if tab_container.current_tab == 0:
			change_tab(tab_container.get_tab_count() - 1)
		
		var previous_tab = tab_container.current_tab - 1
		change_tab(previous_tab)
	
	if Input.is_action_just_pressed("ui_cancel"):
		exit_options_menu.emit()
