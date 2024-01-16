# spawned in main scene
extends CharacterBody2D

@export var visibilityNotifier : VisibleOnScreenNotifier2D
var speed := -150

func _ready() -> void:
	velocity = Vector2.DOWN * speed
	visibilityNotifier.screen_exited.connect(func() -> void:queue_free())

func _physics_process(_delta: float) -> void:
	move_and_collide(velocity * _delta)
