extends Node

@export var starting_state: State
var current_state: State
var previous_state : State

func init(parent: Character) -> void:
	for child in get_children():
		child.parent = parent
	
	change_state(starting_state)

func change_state(new_state: State) -> void:
	print(new_state)
	if current_state != null:
		current_state.exit()
	
	previous_state = current_state # for later usage
	current_state = new_state
	current_state.enter()
	
# Pass through functions for the Player to call,
# handling state changes as needed.
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent) -> void:
	if !current_state:
		return
	var new_state = current_state.process_input(event)
	if new_state:
		await get_tree().process_frame
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

## Button pressed functions
func _on_sleep_button_pressed() -> void:
	print("boton sleep pulsado")
	change_state($SleepState)


func _on_timer_button_pressed() -> void:
	print("boton timer pulsado")
	get_parent().timer_show_petition()
	
