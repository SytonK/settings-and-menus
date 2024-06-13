extends VBoxContainer


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):    
		_toggle_pause()


func _toggle_pause() -> void:
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused


func _on_button_pressed() -> void:
	_toggle_pause()
