extends State

@export var menu_state : State
@export var idle_state : State
@export var grab_state : State
@export var sleep_state : State

@export var move_speed: float = 40
@export var screen_margin: float = 10

var direction : Vector2  # Dirección aleatoria

func enter() -> void:
	super()
	$Timer.start(2.0)
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func exit() -> void:
	$Timer.stop()

func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			return grab_state
	return null

func process_physics(delta: float) -> State:
	if direction != Vector2.ZERO:
		var screen_size = DisplayServer.window_get_size()
		parent.position += direction * move_speed * delta
		if parent.position.x <= screen_margin or parent.position.x + screen_margin >= screen_size.x: # añadir anchura del personaje
			direction.x *= -1
		if parent.position.y <= screen_margin or parent.position.y + screen_margin >= screen_size.y: # añadir altura del personaje
			direction.y *= -1
	
	# Actualizar la zona de clic transparente
	var click_polygon: PackedVector2Array = parent._ClickPolygon.polygon
	
	for vec_i in range(click_polygon.size()):
		click_polygon[vec_i] = parent.to_global(click_polygon[vec_i])
	parent.get_window().mouse_passthrough_polygon = click_polygon
	
	return null

func _on_timer_timeout() -> void:
	get_parent().change_state(idle_state)
