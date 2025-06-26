extends Node2D


@onready var score_label: Label = $ScoreLabel

var score = 0:
	get:
		return score
	set(value):
		score = value
		score_label.text = "Score: " + str(score) 


func _on_ship_ship_destroyed() -> void:
	await get_tree().create_timer(2.0).timeout
	SaveAndLoad.save_highscore(score)
	get_tree().change_scene_to_file("res://Scenes/game_over_screen.tscn")
