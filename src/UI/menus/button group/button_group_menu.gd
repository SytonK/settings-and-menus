extends Control


@onready var top_button: Button = $VBoxContainer/TopButton

func _ready() -> void:
	top_button.grab_focus()
