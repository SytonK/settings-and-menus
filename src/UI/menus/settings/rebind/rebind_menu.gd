extends Control


const INPUT_ACTION_REBIND_BUTTON = preload("res://src/UI/menus/settings/rebind/input action rebind button/input_action_rebind_button.tscn")


@onready var actions_list: VBoxContainer = $Panel/MarginContainer/VBoxContainer/ScrollContainer/ActionsList


func _ready() -> void:
	_create_actions_list()


func _create_actions_list() -> void:
	for action in InputActionsToRebind.input_actions:
		var new_input_action_button: InputActionRebindButton = INPUT_ACTION_REBIND_BUTTON.instantiate()
		
		new_input_action_button.action_name = action
		new_input_action_button.action_label = InputActionsToRebind.input_actions[action]
		
		actions_list.add_child(new_input_action_button)
