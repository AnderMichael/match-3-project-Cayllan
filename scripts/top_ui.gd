extends TextureRect

@onready var score_label = $MarginContainer/HBoxContainer/score_label
@onready var counter_label = $MarginContainer/HBoxContainer/counter_label
@onready var goal_label = $MarginContainer/HBoxContainer/HBoxContainer/goal_label
@onready var timer = $Timer

var current_score = 0
var current_count = 10
var current_time = 45
var game_mode : String

signal game_over
signal you_win
signal you_lose

func _ready():
	current_score = 0
	current_count = 10
	current_time = 45
	_on_grid_sum_points(current_score)
	if(game_mode == 'timer_mode'):
		counter_label.text = str(current_time)
		timer.start()
	else:
		counter_label.text = str(current_count)

func _on_grid_sum_points(accumulated_points):
	current_score += accumulated_points
	score_label.text = str(current_score)
	
	if(current_score >= int(goal_label.text)):
		emit_signal('you_win')
		emit_signal("game_over")
	
	if(current_count == 0):
		emit_signal('you_lose')
		emit_signal("game_over")
		counter_label.text = "OOM"
		
func _on_grid_rest_moves():
	current_count -= 1
	counter_label.text = str(current_count)

func _on_timer_timeout():
	if(current_score >= int(goal_label.text)):
			emit_signal('you_win')
			emit_signal("game_over")
			timer.stop()
	else:
		if(current_time > 0):
			current_time -= 1
			counter_label.text = str(current_time)
		else:
			emit_signal('you_lose')
			emit_signal("game_over")
			counter_label.text = "OOT"
			timer.stop()


func _on_game_start_game(game_mode_selected):
	game_mode = game_mode_selected
	_ready()
	
func _on_reset_button_down():
	_on_game_start_game(game_mode)
