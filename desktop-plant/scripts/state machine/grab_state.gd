extends State

@export var menu_state : State
@export var idle_state : State
@export var move_state : State

@export var lerp_speed : float

var mouse_offset : Vector2

func enter() -> void:
	super()
	#parent.velocity = 0
	mouse_offset = parent.position - parent.get_mouse()
	parent.dragging = true

func exit() -> void:
	parent.dragging = false

func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
			return idle_state
	return null

func _physics_process(delta: float) -> void:
	if parent == null:
		return
	var target_position : Vector2 = parent.get_mouse() + mouse_offset
	parent.position = parent.position.lerp(target_position, lerp_speed)
