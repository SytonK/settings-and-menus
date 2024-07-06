extends Node


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("example1"):
		print('action1')
	if event.is_action_pressed("example2"):
		print('action2')
	if event.is_action_pressed("example3"):
		print('action3')
