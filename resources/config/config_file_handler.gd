extends Node


const SETTINGS_FILE_PATH: String = "user://settings.ini"


var config_file: ConfigFile = ConfigFile.new()


func _ready() -> void:
	if !FileAccess.file_exists(SETTINGS_FILE_PATH):
		config_file.set_value("audio", "master_volum", 0)
		config_file.set_value("audio", "music_volum", 0)
		config_file.set_value("audio", "SFX_volum", 0)
		
		config_file.save(SETTINGS_FILE_PATH)
