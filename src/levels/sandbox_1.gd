extends Node2D


@onready var icon: Sprite2D = $Icon
@onready var sound_effect: AudioStreamPlayer = $SoundEffect


func _process(delta: float) -> void:
	icon.rotation += delta * 2

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("example1"):
		sound_effect.play()
		print('ex1')
	if event.is_action_pressed("example2"):
		print('ex2')
	if event.is_action_pressed("example3"):
		print('ex3')
