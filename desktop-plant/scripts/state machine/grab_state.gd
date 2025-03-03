extends State

@export var menu_state : State
@export var idle_state : State
@export var move_state : State

@export var lerp_speed : float = 0.5

var mouse_offset : Vector2

func enter() -> void:
	super()
	#parent.velocity = 0
	mouse_offset = parent.position - parent.get_mouse()

func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
			return idle_state
	return null

func process_physics(delta: float) -> State:
	var target_position : Vector2 = parent.get_mouse() + mouse_offset
	parent.position = parent.position.lerp(target_position, lerp_speed)
	
	var click_polygon: PackedVector2Array = parent._ClickPolygon.polygon
	var screen_size = DisplayServer.window_get_size()
	click_polygon = PackedVector2Array([
		Vector2(0, 0),
		Vector2(screen_size.x, 0),
		Vector2(screen_size.x, screen_size.y),
		Vector2(0, screen_size.y)
	])
	
	parent.get_window().mouse_passthrough_polygon = click_polygon
	
	return null
