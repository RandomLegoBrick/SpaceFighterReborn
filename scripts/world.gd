extends Node3D

var asteroidScene: PackedScene = load("res://scenes/asteroid.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# smooths everything out, can also enable physics interpolation later for uncapped fps but this was simpler for the moment
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	Engine.set_physics_ticks_per_second(DisplayServer.screen_get_refresh_rate())
	
	
		
	var asteroids = 200
	var WORLD_SIZE = 200
	
	for i in asteroids:
		var asteroid = asteroidScene.instantiate()
		var asteroidPos = Vector3((randf() - 0.5) * WORLD_SIZE, 0, (randf() - 0.5) * WORLD_SIZE)
		
		asteroid.position = asteroidPos
		
		$AsteroidArray.add_child(asteroid)
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("FULLSCREEN"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN else DisplayServer.WINDOW_MODE_FULLSCREEN)
		print("switch")
