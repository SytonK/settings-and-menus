extends Control


const INPUT_ACTION_REBIND_BUTTON = preload("res://src/UI/menus/settings/rebind/input action rebind button/input_action_rebind_button.tscn")


@onready var actions_list: VBoxContainer = $Panel/MarginContainer/VBoxContainer/ScrollContainer/ActionsList

var remapping_button: InputActionRebindButton = null


func _ready() -> void:
	_create_actions_list()


func _input(event: InputEvent) -> void:
	if remapping_button:
		if (
			event is InputEventKey ||
			(event is InputEventMouseButton && event.is_pressed())
		):
			InputMap.action_erase_events(remapping_button.action_name)
			InputMap.action_add_event(remapping_button.action_name, event)
			remapping_button.is_remaping =  false
			remapping_button = null


func _create_actions_list() -> void:
	for action in InputActionsToRebind.input_actions:
		var new_input_action_button: InputActionRebindButton = INPUT_ACTION_REBIND_BUTTON.instantiate()
		
		new_input_action_button.action_name = action
		new_input_action_button.action_text = InputActionsToRebind.input_actions[action]
		new_input_action_button.remaping.connect(_on_action_pressed)
		
		actions_list.add_child(new_input_action_button)


func _on_action_pressed(action: InputActionRebindButton):
	remapping_button = action
