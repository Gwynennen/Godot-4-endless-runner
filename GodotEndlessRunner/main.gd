extends Node2D

@export var UI : CanvasLayer
var Player : CharacterBody2D
var Obstacles := [CharacterBody2D]

func _ready() -> void:
	Globals.playerCollided.connect(set_state)
	
	Player = Preloads.PLAYER.instantiate()
	Player.position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y - Player.sprite.get_rect().size.y/3)
	add_child(Player)
	spawn_obstacle(Vector2(get_viewport_rect().size.x/4, 0))
	spawn_obstacle(Vector2(get_viewport_rect().size.x/4*3, 0))

func set_state() -> void:
	UI.show_label()

func spawn_obstacle(_pos: Vector2) -> void:
	Obstacles.append(Preloads.OBSTACLE.instantiate())
	Obstacles[-1].position = _pos
	add_child(Obstacles[-1])
