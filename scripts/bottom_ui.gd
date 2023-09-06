extends TextureRect

@onready var win_advice = $MarginContainer/HBoxContainer/win_advice
@onready var reset = $MarginContainer/HBoxContainer/Reset

func _ready():
	hide_text_button()
		
func _on_top_ui_you_win():
	show_text_button()
	win_advice.text = "You Win!!!!!"

func _on_top_ui_you_lose():
	show_text_button()
	win_advice.text = "You Lose... try again"

func show_text_button():
	win_advice.visible = true
	reset.visible = true
	
func hide_text_button():
	win_advice.visible = false
	reset.visible = false


func _on_reset_button_down():
	hide_text_button()
