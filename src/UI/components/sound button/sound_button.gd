class_name SoundButton extends Button


func _ready() -> void:
	mouse_entered.connect(GlobalUiSound.ui_sound_play.bind("UIHover"))
	focus_entered.connect(GlobalUiSound.ui_sound_play.bind("UIHover"))
	pressed.connect(GlobalUiSound.ui_sound_play.bind("UIClick"))
