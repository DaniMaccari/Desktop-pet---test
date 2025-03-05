extends Sprite2D

@onready var _ClickPolygon: CollisionPolygon2D = $ClickArea/ClickPolygon

var dragging_popup: bool = false
var mouse_offset: Vector2 = Vector2(0, 0)
var lerp_speed: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	
	var click_polygon: PackedVector2Array = _ClickPolygon.polygon
	if dragging_popup:
		var target_position : Vector2 = get_global_mouse_position() + mouse_offset
		position = position.lerp(target_position, lerp_speed)
		click_polygon = []
	else:
		for vec_i in range(click_polygon.size()):
			click_polygon[vec_i] = to_global(click_polygon[vec_i])
	get_window().mouse_passthrough_polygon = click_polygon

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			dragging_popup = true
		else:
			dragging_popup = false
