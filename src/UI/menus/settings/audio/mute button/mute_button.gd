class_name MuteButton
extends TextureButton


@export var bus_name: String

@onready var audio_bus: int = AudioServer.get_bus_index(bus_name)


func _ready() -> void:
	button_pressed = AudioServer.is_bus_mute(audio_bus)


func _on_pressed() -> void:
	AudioServer.set_bus_mute(audio_bus, !AudioServer.is_bus_mute(audio_bus))
