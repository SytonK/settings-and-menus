class_name UISound extends Node


@export var root: Node


@onready var sounds = {
	&"UI_Hover": AudioStreamPlayer.new(),
	&"UI_Click": AudioStreamPlayer.new()
}


func _ready() -> void:
	if !root:
		root = get_parent()
	
	for sound in sounds.keys():
		sounds[sound].stream = load("res://assets/sound/effects/" + str(sound) + ".mp3")
		sounds[sound].bus = &"UISound"
		add_child(sounds[sound])
	
	_install_sounds(root)

func _install_sounds(node: Node) -> void:
	for childe in node.get_children():
		if childe is Button:
			childe.mouse_entered.connect(_ui_sound_play.bind(&"UI_Hover"))
			childe.pressed.connect(_ui_sound_play.bind(&"UI_Click"))
		
		_install_sounds(childe)


func _ui_sound_play(sound: String) -> void:
	sounds[sound].play()
