extends State

@export var menu_state : State
@export var idle_state : State
@export var grab_state : State

func enter() -> void:
	super()
	#parent.velocity = 0
	$Timer.start(3.0)
