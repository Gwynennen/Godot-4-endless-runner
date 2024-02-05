extends ParallaxBackground

@export var layer1 : ParallaxLayer
var motionSpeed := 1


func _physics_process(delta: float) -> void:
	layer1.motion_offset.y += motionSpeed
	if layer1.motion_offset.y == 720:
		layer1.motion_offset.y = 0
