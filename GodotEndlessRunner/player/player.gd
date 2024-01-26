# spawned in the main scene
extends CharacterBody2D

@export var sprite : Sprite2D
var speed := 300
var attackSpeed := 0.5
var ifJustAttacked = false
var attackTimer := Timer.new()

func _ready() -> void:
	attackTimer.wait_time = attackSpeed
	attackTimer.timeout.connect(func() -> void: ifJustAttacked = false)
	add_child(attackTimer)

func _input(event: InputEvent) -> void:
	velocity = Vector2(Input.get_axis("ui_left", "ui_right"), 0)*speed
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if !ifJustAttacked:
			Globals.playerAttacked.emit()
			ifJustAttacked = true
			attackTimer.start()

func _physics_process(_delta: float) -> void:
	if move_and_slide():
		velocity.y = 0
		Globals.playerCollided.emit()

