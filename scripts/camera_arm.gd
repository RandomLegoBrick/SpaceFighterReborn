extends Node3D

func _physics_process(delta: float) -> void:
	
	# lerp CameraArm position to the players position
	position = lerp(position, $"../Player".position, 10 * delta)
	
