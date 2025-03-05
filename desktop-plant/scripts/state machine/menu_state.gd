extends State

## MENU STATE
@export var idle_state : State
@export var grab_state : State
@export var move_state : State
@export var sleep_state : State

@export var menu : Node2D

var top_margin : int = 5
var side_margin : int = 10

func enter() -> void:
	super()
	set_menu_rotation()
	parent.show_menu()

func exit() -> void:
	parent.hide_menu()

func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton and event.is_pressed():
		#parent.hide_menu()
		#process_physics(0.0)
		return idle_state
		
		## TODO si el input click está dentro del area pasa a idle/grab
		## pero si hay click fuera pasa idle
		#if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			#return idle_state
		#elif event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			#return idle_state
	return null

func process_physics(delta: float) -> State:
	var menu_polygon: PackedVector2Array#= parent._MenuPolygon.polygon
	
	#for vec_i in range(menu_polygon.size()):
		#menu_polygon[vec_i] = parent.to_global(menu_polygon[vec_i])
	var screen_size = DisplayServer.window_get_size()
	menu_polygon = []
	#PackedVector2Array([
		#Vector2(0, 0),
		#Vector2(screen_size.x, 0),
		#Vector2(screen_size.x, screen_size.y),
		#Vector2(0, screen_size.y)
	#])
	parent.get_window().mouse_passthrough_polygon = menu_polygon
	
	return null

func set_menu_rotation() -> void:
	var screen_size = DisplayServer.window_get_size()
	#var half_screen = screen_size.x / 2
	
	## menu rotation
	if parent.global_position.y <= screen_size.y / top_margin:
		if parent.global_position.x <= screen_size.x / side_margin:
			menu.rotation_degrees = 135
		elif parent.global_position.x >= screen_size.x - (screen_size.x / side_margin):
			menu.rotation_degrees = 225
		else :
			menu.rotation_degrees = 180
	
	else:
		if parent.global_position.x <= screen_size.x / side_margin:
			menu.rotation_degrees = 45
		elif parent.global_position.x >= screen_size.x - (screen_size.x / side_margin):
			menu.rotation_degrees = 315
		else :
			menu.rotation_degrees = 0
	
	## buttons set correct rottation
	for button in menu.get_children():
		if button.is_in_group("menu_select"):
			button.rotation_degrees = -menu.rotation_degrees
