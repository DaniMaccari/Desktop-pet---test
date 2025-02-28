extends Node2D

@onready var _MainWindow: Window = get_window()
@onready var _MainScreen: int = _MainWindow.current_screen
@onready var character_region : Polygon2D = $character/click_region

func _ready() -> void:
	
	# set transparent window
	get_tree().get_root().set_transparent_background(true)

	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_TRANSPARENT, true)
	RenderingServer.set_default_clear_color(Color(0, 0, 0, 0))
	get_viewport().transparent_bg = true
	
	# set mouse passthorough
	print("screen ", _MainScreen)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_MOUSE_PASSTHROUGH, true, _MainScreen)
	DisplayServer.window_set_mouse_passthrough(character_region.polygon, _MainScreen)

func _input(event: InputEvent) -> void:
	print("input ", event)
