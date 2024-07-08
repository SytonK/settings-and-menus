extends HSlider

@export var bus_name: String

@onready var audio_bus: int = AudioServer.get_bus_index(bus_name)


func _ready() -> void:
	value = AudioServer.get_bus_volume_db(audio_bus)


func _on_drag_ended(_value_changed: bool) -> void:
	AudioServer.set_bus_volume_db(audio_bus, value)
