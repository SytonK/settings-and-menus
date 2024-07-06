class_name InputActionRebindButton
extends Button


const REMAPING_TEXT: String = 'Press a key to select'

signal remaping(input_action_rebind_button: InputActionRebindButton)

@export var action_name: String : set = _set_action_name
@export var action_text: String

@onready var action_name_label: Label = $MarginContainer/HBoxContainer/ActionNameLabel
@onready var action_input_label: Label = $MarginContainer/HBoxContainer/ActionInputLabel

var is_remaping: bool = false : set = _set_is_remapping


func _ready() -> void:
	_set_action_name(action_name)


func _set_action_name(new_action_name: String) -> void:
	action_name = new_action_name
	
	if action_name_label:
		action_name_label.text = action_text
	
	_set_action_input_label()


func _set_action_input_label():
	if action_input_label:
		var events = InputMap.action_get_events(action_name)
		action_input_label.text = events[0].as_text().trim_suffix(' (Physical)') if events.size() > 0 else ""


func _on_pressed() -> void:
	is_remaping = true


func _set_is_remapping(new_is_remapping: bool):
	is_remaping = new_is_remapping
	if is_remaping:
		action_input_label.text = REMAPING_TEXT
		remaping.emit(self)
	else:
		_set_action_input_label()
