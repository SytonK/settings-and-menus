class_name InputActionRebindButton
extends Button


@export var action_name: String : set = _set_action_name
@export var action_label: String

@onready var action_name_label: Label = $MarginContainer/HBoxContainer/ActionNameLabel
@onready var action_input_label: Label = $MarginContainer/HBoxContainer/ActionInputLabel


func _ready() -> void:
	_set_action_name(action_name)


func _set_action_name(new_action_name: String) -> void:
	action_name = new_action_name
	
	if action_name_label:
		action_name_label.text = action_label
	
	if action_input_label:
		var events = InputMap.action_get_events(action_name)
		print(action_name)
		action_input_label.text = events[0].as_text() if events.size() > 0 else ""
