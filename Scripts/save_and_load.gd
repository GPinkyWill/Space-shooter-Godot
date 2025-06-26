extends Node

const SAVE_PATH := "user://Scripts/Save/save.cfg"
func save_highscore(highscore):
	var config = ConfigFile.new()
	config.set_value("Game", "Highscore", highscore)
	config.save(SAVE_PATH)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func load_highscore():
	var highscore = 0
	var config = ConfigFile.new()
	var error = config.load(SAVE_PATH)
	if error != OK: return null
	highscore = config.get_value("Game","Highscore")
	return highscore
