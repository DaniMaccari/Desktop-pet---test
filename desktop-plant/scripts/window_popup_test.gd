extends Window

func init(new_size: Vector2) -> void:
	size.x = new_size.x
	size.y = new_size.y
	#size = DisplayServer.window_get_size()
	_initialize_window()
	pass

func _initialize_window() -> void:
	# You don't need to change all of these settings via a function during
	# runtime since you can set them from the settings menu at Project ->
	# Project Settings -> Window.
	var window: Window = get_window()
	# Setting the viewport width and height from the project settings still
	# displays the boot splash, which is undesirable for a transparent app.
	# To avoid this, set the viewport width and height from the project
	# settings to 0, and then use the two functions provided below. You can
	# read the documentation for these functions to learn about what they do.
	window.size = Vector2i(DisplayServer.screen_get_size() + Vector2i(1, 1))
	window.position = DisplayServer.screen_get_position()
