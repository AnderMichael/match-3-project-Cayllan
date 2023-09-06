extends Node2D

@export var timer_mode : bool = false
signal start_game
# Called when the node enters the scene tree for the first time.
func _ready():
	if timer_mode:
		emit_signal("start_game", "timer_mode")
	else:
		emit_signal("start_game", "moving_mode")

