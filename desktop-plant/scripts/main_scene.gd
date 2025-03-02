extends Node3D


# ESCENA 3D
func _ready() -> void:
	get_tree().get_root().set_transparent_background(true)

	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_TRANSPARENT, true)
	RenderingServer.set_default_clear_color(Color(0, 0, 0, 0))
	get_viewport().transparent_bg = true
	
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_MOUSE_PASSTHROUGH, true, 0)
	#DisplayServer.window_set_mouse_passthrough([Vector2(0, 0), Vector2(100, 0), Vector2(100, 100), Vector2(0, 100)], 0)	
	
