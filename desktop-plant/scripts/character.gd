class_name Character
extends Sprite2D

# rendered Area
@onready
var _ClickPolygon: CollisionPolygon2D = $ClickArea/ClickPolygon
#@onready
#var _MenuPolygon: CollisionPolygon2D = $Menu/MenuArea/MenuPolygon
@onready
var state_machine = $StateMachine

# character variables
var looking_dir : int = 90 # inicia mirando ABAJO, 0º DERECHA
var mouse_offset : Vector2
var dragging : bool = false
var lerp_speed : float = 0.6

func _ready() -> void:
	state_machine.init($".")
	$Menu.hide()

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func get_mouse() -> Vector2:
	return get_global_mouse_position()

func show_menu() -> void:
	$Menu.show()

func hide_menu() -> void:
	$Menu.hide()

#func _physics_process(_delta: float) -> void:
	#pass
	#if dragging:
		#var target_position : Vector2 = get_global_mouse_position() + mouse_offset
		#position = position.lerp(target_position, lerp_speed)
	#_update_click_polygon()

# Updates the clickable area, preventing inputs from passing through the
# window outside of the defined region.
#func _update_click_polygon_original() -> void:
	#var click_polygon: PackedVector2Array = _ClickPolygon.polygon
	#for vec_i in range(click_polygon.size()):
		#click_polygon[vec_i] = to_global(click_polygon)
	#get_window().mouse_passthrough_polygon = click_polygon

#func _update_click_polygon() -> void:
	#var click_polygon: PackedVector2Array = _ClickPolygon.polygon
	#
	#if dragging:
		## Obtiene el tamaño de la pantalla
		#var screen_size = DisplayServer.window_get_size()
		#click_polygon = PackedVector2Array([
			#Vector2(0, 0),
			#Vector2(screen_size.x, 0),
			#Vector2(screen_size.x, screen_size.y),
			#Vector2(0, screen_size.y)
		#])
	#else:
		#for vec_i in range(click_polygon.size()):
			#click_polygon[vec_i] = to_global(click_polygon[vec_i])
#
	#get_window().mouse_passthrough_polygon = click_polygon

#func _on_click_area_input_event(_viewport: Node, event: InputEvent,
		#_shape_idx: int) -> void:
	#
	## comprobar clicks
	#if event is InputEventMouseButton:
		#
		## click izquierdo, MOVER
		#if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			#if not dragging:
				#dragging = true
				#mouse_offset = position - get_global_mouse_position()
		#else:
			#dragging = false
			#print(get_global_mouse_position())
		#
		## click derecho, OPCIONES
		#if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			#var window_size: Vector2i = get_window().size
			#global_position = Vector2(randf_range(0, window_size.x),
					#randf_range(0, window_size.y))
