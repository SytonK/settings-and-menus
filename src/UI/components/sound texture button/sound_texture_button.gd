class_name SoundTextureButton extends TextureButton


func _init() -> void:
	mouse_entered.connect(GlobalUiSound.ui_sound_play.bind("UIHover"))
	focus_entered.connect(GlobalUiSound.ui_sound_play.bind("UIHover"))
	pressed.connect(GlobalUiSound.ui_sound_play.bind("UIClick"))
