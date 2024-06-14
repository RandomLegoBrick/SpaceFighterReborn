extends CharacterBody3D

@export var THRUST: float = 1
@export var DRAG: float = 0.03
@export var HANDLING_FACTOR = 0.003
@export var MAX_SPEED = 20;

var rotationVelocity = 0

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("THROTTLE") and velocity.length() < MAX_SPEED:
		var direction = Vector3(cos(-rotation.y) * THRUST, 0, sin(-rotation.y) * THRUST)
		
		velocity += direction
	else:
		velocity *= 1 - DRAG
	
	
	rotation.y += rotationVelocity;
	var rotationFactor = Input.get_axis("LEFT", "RIGHT") * HANDLING_FACTOR * velocity.length() * delta
	rotationVelocity -= rotationFactor
	rotationVelocity *= 1 - DRAG;
	
	rotation.x = rotationVelocity * -10
	

	move_and_slide()
