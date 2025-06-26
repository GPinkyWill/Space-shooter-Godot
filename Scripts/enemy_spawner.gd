extends Node2D

const ENEMY_SCENE = preload("res://Scenes/enemy.tscn")

@onready var spawn_point: Node2D = $SpawnPoint

# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_spawn_position():
	var points = spawn_point.get_children()
	var random_point = points.pick_random()
	return random_point.global_position
	
	
func _spawn_enemy():
	var enemy = ENEMY_SCENE.instantiate()
	var world = get_tree().current_scene
	world.add_child(enemy)
	var spawn_position = get_spawn_position()
	enemy.global_position = spawn_position
	pass


func _on_timer_timeout() -> void:
	_spawn_enemy()
