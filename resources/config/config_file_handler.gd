extends Node


const SETTINGS_FILE_PATH: String = "user://settings.ini"


var config_file: ConfigFile = ConfigFile.new()


func _ready() -> void:
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		_set_default_audio_settings()
		_set_default_keybind_settings()
		
		config_file.save(SETTINGS_FILE_PATH)
	else:
		config_file.load(SETTINGS_FILE_PATH)
		
		_load_audio_settings()
		_load_keybind_settings()


func _set_default_audio_settings() -> void:
	config_file.set_value("audio", "master_muted", false)
	config_file.set_value("audio", "master_volum", 0)
	config_file.set_value("audio", "music_muted", false)
	config_file.set_value("audio", "music_volum", 0)
	config_file.set_value("audio", "sfx_muted", false)
	config_file.set_value("audio", "sfx_volum", 0)

func save_audio_settings(key: String, value):
	config_file.set_value('audio', key, value)
	config_file.save(SETTINGS_FILE_PATH)

func _load_audio_settings() -> void:
	AudioServer.set_bus_mute(0, config_file.get_value('audio', 'master_muted'))
	AudioServer.set_bus_volume_db(0, config_file.get_value('audio', 'master_volum'))
	AudioServer.set_bus_mute(1, config_file.get_value('audio', 'music_muted'))
	AudioServer.set_bus_volume_db(1, config_file.get_value('audio', 'music_volum'))
	AudioServer.set_bus_mute(2, config_file.get_value('audio', 'sfx_muted'))
	AudioServer.set_bus_volume_db(2, config_file.get_value('audio', 'sfx_volum'))


func _set_default_keybind_settings() -> void:
	config_file.set_value("keybind", "example1", '1')
	config_file.set_value("keybind", "example2", '2')
	config_file.set_value("keybind", "example3", '3')

func save_keybinding(action: String, event: InputEvent):
	var event_str
	if event is InputEventKey:
		event_str = OS.get_keycode_string(event.physical_keycode)
	elif event is InputEventMouseButton:
		event_str = 'mouse_' + str(event.button_index)
	
	config_file.set_value('keybind', action, event_str)
	config_file.save(SETTINGS_FILE_PATH)

func _load_keybind_settings() -> void:
	for keybind in config_file.get_section_keys('keybind'):
		var input_event: InputEvent
		var event_str: String = config_file.get_value('keybind', keybind)
		
		if event_str.contains('mouse_'):
			input_event = InputEventMouseButton.new()
			input_event.button_index = int(event_str.split('_')[1])
		else:
			input_event = InputEventKey.new()
			input_event.keycode = OS.find_keycode_from_string(event_str)
		
		InputMap.action_erase_events(keybind)
		InputMap.action_add_event(keybind, input_event)
