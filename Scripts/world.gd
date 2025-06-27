extends Node2D

@onready var timer: Timer = $Timer

@onready var score_label: Label = $ScoreLabel

var score = 0:
	get:
		return score
	set(value):
		score = value
		score_label.text = "Score: " + str(score) 


func _on_ship_ship_destroyed() -> void:
	timer.start()


func _on_timer_timeout() -> void:
	var highscore = SaveAndLoad.load_highscore()
	if highscore != null:
		if score > highscore:
			SaveAndLoad.save_highscore(score)
	else:
		SaveAndLoad.save_highscore(score)
	get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")
