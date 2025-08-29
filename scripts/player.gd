extends CharacterBody3D

# some constants
@export var THRUST: float = 1
@export var DRAG: float = 0.03
@export var HANDLING_FACTOR = 0.003
@export var MAX_SPEED = 20;
@export var push_force = 10;

var rotationVelocity = 0

func _physics_process(delta: float) -> void:
	
	
	
	# handle trottle
	if Input.is_action_pressed("THROTTLE") and velocity.length() < MAX_SPEED:
		var direction = Vector3(cos(-rotation.y) * THRUST, 0, sin(-rotation.y) * THRUST) # move on x and z axis
		
		velocity += direction # godot will handle delta for movement in the move_and_slide function so we dont need it
	else:
		velocity *= 1 - DRAG
	
	# rotate based off of the speed of the plane and the left and right inputs
	rotationVelocity -= Input.get_axis("LEFT", "RIGHT") * HANDLING_FACTOR * velocity.length() * delta
	rotationVelocity *= 1 - DRAG;
	
	position.y = lerp(position.y, 0.0, 10 * delta);
	
	rotation.y += rotationVelocity;
	
	rotation.x = rotationVelocity * -10 # roll when the ship turns

	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody3D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
			$"../CameraArm".shake = 3;
			print(true);
