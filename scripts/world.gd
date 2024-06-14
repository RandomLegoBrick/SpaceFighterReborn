extends Node3D

var asteroidScene: PackedScene = load("res://scenes/asteroid.tscn") # store the asteroid scene for use later

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# smooths everything out, can also enable physics interpolation later for uncapped fps but this was simpler for the moment
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	Engine.set_physics_ticks_per_second(DisplayServer.screen_get_refresh_rate())
	
	
	# create some asteroids
	var asteroids = 200
	var WORLD_SIZE = 200
	
	for i in asteroids:
		
		# .instantiate() is like javascript new classname(); but for scenes
		var asteroid = asteroidScene.instantiate()
		
		# get a random position (randf is 0 to 1)
		var asteroidPos = Vector3((randf() - 0.5) * WORLD_SIZE, 0, (randf() - 0.5) * WORLD_SIZE)
		
		# set the random position
		asteroid.position = asteroidPos
		
		# add it to the AsteroidArray node, it could be added to the root node but its helpfull to visualize it as an array sometimes
		$AsteroidArray.add_child(asteroid)
	
	
func _input(event: InputEvent) -> void:
		
	# listen for the escape key and toggle fullscreen
	if event.is_action_pressed("FULLSCREEN"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN else DisplayServer.WINDOW_MODE_FULLSCREEN)
