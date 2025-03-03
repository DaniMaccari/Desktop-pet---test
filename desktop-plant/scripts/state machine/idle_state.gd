extends State

@export var menu_state : State
@export var grab_state : State
@export var move_state : State

func enter() -> void:
	super()
	#parent.velocity = 0
	$Timer.start(3.0)

func process_input(event: InputEvent) -> State:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			return grab_state
	return null

func process_physics(delta: float) -> State:
	parent._update_click_polygon()
	return null
	

func _on_timer_timeout() -> void:
	#get_parent().change_state(move_state)
	pass
