extends Window

@export var initial_time: int = 25
var clock_time: int
var is_active = false
var in_progress = false # is first time started (initial_time == clock_time)

# nodes
@onready var clock_timer: Timer = $Timer
@onready var clock_text: RichTextLabel = $TimerText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_clock_text(initial_time)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_test_button_pressed() -> void:
	
	if is_active:
		print("STOP")
		clock_timer.stop()
		is_active = false
	
	else:
		print("START")
		if in_progress:
			clock_timer.start()
			is_active = true
		else:
			clock_time = initial_time
			in_progress = true
	
	update_clock_text(clock_time)
	


func _on_timer_timeout() -> void:
	print("clock ", "tick")
	clock_time -= 1
	update_clock_text(clock_time)
	

func update_clock_text(new_time) -> void:
	clock_text.clear()
	var time_to_string: String
	# poner como reloj cuando +60 minutos
	#if clock_time > 60:
		#var hours: int = clock_time / 60
		#var minutes: int = clock_time % 60
		#time_to_string = ("%02d" % hours) + ":" + ("%02d" % minutes)
		#clock_text.add_theme_font_size_override("normal_font_size", 40)
	#
	#else:
		#time_to_string = "%02d" % clock_time
		#clock_text.add_theme_font_size_override("normal_font_size", 65)
	
	time_to_string = "%01d" % new_time
	clock_text.add_theme_font_size_override("normal_font_size", 65)
	
	clock_text.append_text("[center]" + time_to_string + "[/center]")
	#clock_text.append_text(time_to_string)
	


func _on_add_minutes_button_pressed() -> void:
	initial_time += 5
	update_clock_text(initial_time)


func _on_substract_minutes_button_pressed() -> void:
	initial_time -= 5
	update_clock_text(initial_time)
