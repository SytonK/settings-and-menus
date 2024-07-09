extends Node


const SETTINGS_FILE_PATH: String = "user://settings.ini"


var config_file: ConfigFile = ConfigFile.new()


func _ready() -> void:
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		set_default_audio_settings()
		
		config_file.save(SETTINGS_FILE_PATH)
	else:
		config_file.load(SETTINGS_FILE_PATH)


func set_default_audio_settings() -> void:
	config_file.set_value("audio", "master_muted", false)
	config_file.set_value("audio", "master_volum", 0)
	config_file.set_value("audio", "music_muted", false)
	config_file.set_value("audio", "music_volum", 0)
	config_file.set_value("audio", "sfx_muted", false)
	config_file.set_value("audio", "sfx_volum", 0)

func save_audio_settings(key: String, value):
	config_file.set_value('audio', key, value)
	config_file.save(SETTINGS_FILE_PATH)

func load_audio_settings() -> Dictionary:
	var audio_settings = {}
	for key in config_file.get_section_keys('audio'):
		audio_settings[key] = config_file.get_value('audio', key)
	return audio_settings
