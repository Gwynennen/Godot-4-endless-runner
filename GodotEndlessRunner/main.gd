extends Node2D

@export var UI : CanvasLayer
var Player : CharacterBody2D
var Obstacles : Array[CharacterBody2D]
var obstacleGenerator := Timer.new()
var generateInterval := 1.5
var Projectiles : Array[CharacterBody2D]

func _ready() -> void:
	Globals.playerCollided.connect(func() -> void: UI.show_label())
	Globals.playerAttacked.connect(spawn_player_attack)
	
	Player = Preloads.PLAYER.instantiate()
	Player.position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y - Player.sprite.get_rect().size.y/3)
	add_child(Player)
	
	start_obstacles()

func spawn_player_attack() -> void:
	Projectiles.append(Preloads.PROJECTILE.instantiate())
	Projectiles[-1].position = Player.position
	add_child(Projectiles[-1])

func start_obstacles() -> void:
	obstacleGenerator.wait_time = generateInterval
	obstacleGenerator.timeout.connect(func() -> void:
		Obstacles.append(Preloads.OBSTACLE.instantiate())
		Obstacles[-1].position = Vector2(get_viewport_rect().size.x*randf_range(0,1), -Obstacles[-1].sprite.get_rect().size.y/2)
		add_child(Obstacles[-1])
	)
	add_child(obstacleGenerator)
	obstacleGenerator.start()
	
