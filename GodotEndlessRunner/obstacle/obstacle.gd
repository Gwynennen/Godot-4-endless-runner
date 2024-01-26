# spawned in main scene
extends CharacterBody2D

@export var visibilityNotifier : VisibleOnScreenNotifier2D
@export var sprite : Sprite2D
@export var damageIndicator : Line2D
var speed := 200
var durability := 2

func _ready() -> void:
	add_to_group(Globals.GROUPS.obstacles)
	velocity = Vector2.DOWN * speed
	visibilityNotifier.screen_exited.connect(func() -> void:queue_free())

func _physics_process(_delta: float) -> void:
	var collision = move_and_collide(velocity * _delta)
	
func get_hit():
	durability -= 1
	if durability == 0:
		queue_free()
	elif durability == 1:
		damageIndicator.set_scale(Vector2i([-1,1].pick_random(), [-1,1].pick_random()))
		damageIndicator.set_visible(true)
