extends State

@export var menu_state : State
@export var grab_state : State
@export var move_state : State
@export var sleep_state : State

func enter() -> void:
	super()
	#parent.velocity = 0
	$Timer.start(2.0)

func exit() -> void:
	$Timer.stop()

func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			return grab_state
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			return menu_state
	return null

func process_physics(delta: float) -> State:
	var click_polygon: PackedVector2Array = parent._ClickPolygon.polygon
	
	for vec_i in range(click_polygon.size()):
		click_polygon[vec_i] = parent.to_global(click_polygon[vec_i])
	parent.get_window().mouse_passthrough_polygon = click_polygon
	
	return null

func _on_timer_timeout() -> void:
	get_parent().change_state(move_state)
	pass
