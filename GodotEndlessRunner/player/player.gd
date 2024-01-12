# spawned in the main scene
extends CharacterBody2D

@export var sprite : Sprite2D
var speed := 200

func _physics_process(_delta: float) -> void:
	velocity = Vector2(Input.get_axis("ui_left", "ui_right"), 0)*speed
	if move_and_slide():
		Globals.playerCollided.emit()
