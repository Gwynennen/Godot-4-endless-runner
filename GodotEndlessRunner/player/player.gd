# spawned in the main scene
extends CharacterBody2D

@export var sprite : Sprite2D
var speed := 200

func _input(event: InputEvent) -> void:
	velocity = Vector2(Input.get_axis("ui_left", "ui_right"), 0)*speed
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		Globals.playerAttacked.emit()

func _physics_process(_delta: float) -> void:
	if move_and_slide():
		velocity.y = 0
		Globals.playerCollided.emit()

