extends Control


@onready var rebind_menu: Control = $VBoxContainer/RebindMenu
@onready var audio_menu: Control = $VBoxContainer/AudioMenu

@onready var curr_settings_menu: Control = rebind_menu : set = _set_curr_settings_menu

@onready var keybinds_settings_button: Button = $VBoxContainer/HBoxContainer/KeybindsSettingsButton


func _ready() -> void:
	keybinds_settings_button.grab_focus()


func _on_keybinds_settings_button_pressed() -> void:
	curr_settings_menu = rebind_menu


func _on_audio_settings_button_pressed() -> void:
	curr_settings_menu = audio_menu


func _set_curr_settings_menu(new_menu: Control) -> void:
	curr_settings_menu.visible = false
	curr_settings_menu = new_menu
	curr_settings_menu.visible = true
