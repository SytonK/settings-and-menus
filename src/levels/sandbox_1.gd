extends Node2D


@onready var icon: Sprite2D = $Icon


func _process(delta: float) -> void:
	icon.rotation += delta * 2
