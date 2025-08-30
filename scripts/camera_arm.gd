extends Node3D

var shake: float = 0;
var decay: float = 10;

func _physics_process(delta: float) -> void:
	
	# lerp CameraArm position to the players position
	position = lerp(position, $"../Player".position, 10 * delta)
	
	if shake > 0:
		position += Vector3((randf() - 0.5) * shake, 0.0, (randf() - 0.5) * shake)
		shake -= decay * delta;
		
