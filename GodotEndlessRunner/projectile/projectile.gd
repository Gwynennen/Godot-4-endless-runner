# spawned in main scene
extends CharacterBody2D

@export var visibilityNotifier : VisibleOnScreenNotifier2D
var speed := -150

func _ready() -> void:
	velocity = Vector2.DOWN * speed
	visibilityNotifier.screen_exited.connect(func() -> void: queue_free())

func _physics_process(_delta: float) -> void:
	var collision = move_and_collide(velocity * _delta)
	if collision:
		if collision.get_collider().is_in_group(Globals.GROUPS.obstacles):
			collision.get_collider().get_hit()
			queue_free()

	set_rotation(get_rotation()+0.1)
