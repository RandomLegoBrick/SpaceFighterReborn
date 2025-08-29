extends RigidBody3D

var direction = Vector3(randf() - 0.5, 0, randf() - 0.5);


func _ready():
	apply_force(direction * 10)
	

func _physics_process(delta: float) -> void:
	position.y = 0
	
