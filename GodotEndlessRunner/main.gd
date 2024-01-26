extends Node2D

@export var UI : CanvasLayer
@export var FolderAttacks : Node
@export var FolderObstacles : Node
var Player : CharacterBody2D
var obstacleGenerator := Timer.new()
var generateInterval := 1.5

func _ready() -> void:
	Globals.playerCollided.connect(func() -> void: UI.show_label())
	Globals.playerAttacked.connect(spawn_player_attack)
	
	Player = Preloads.PLAYER.instantiate()
	Player.position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y - Player.sprite.get_rect().size.y/3)
	add_child(Player)
	
	start_obstacles()

func spawn_player_attack() -> void:
	var projectile := Preloads.PROJECTILE.instantiate()
	projectile.position = Player.position
	FolderAttacks.add_child(projectile)

func start_obstacles() -> void:
	obstacleGenerator.wait_time = generateInterval
	obstacleGenerator.timeout.connect(func() -> void:
		var obstacles := Preloads.OBSTACLE.instantiate()
		obstacles.position = Vector2(get_viewport_rect().size.x*randf_range(0,1), -obstacles.sprite.get_rect().size.y/2)
		FolderObstacles.add_child(obstacles)
	)
	add_child(obstacleGenerator)
	obstacleGenerator.start()
	
