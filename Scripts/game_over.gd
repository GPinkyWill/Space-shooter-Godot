extends ColorRect


@onready var highscore_text: Label = $HighscoreText


func _ready() -> void:
	var highscore = SaveAndLoad.load_highscore()
	if highscore == null: return
	highscore_text.text = "Highscore: " + str(highscore)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")
