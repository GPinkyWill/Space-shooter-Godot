extends Area2D

@export var speed = 100

const LASER_SCENE = preload("res://Scenes/laser.tscn")

signal ship_destroyed

var height = ProjectSettings.get_setting("display/window/size/viewport_height")

var width = ProjectSettings.get_setting("display/window/size/viewport_width")

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up") && position.y > 16:
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down") && position.y < height - 16:
		position.y += speed * delta
	if Input.is_action_pressed("ui_left") && position.x > 16:
		position.x -= speed * delta
	if Input.is_action_pressed("ui_right") && position.x < width/2:
		position.x += speed * delta
		
	if Input.is_action_just_pressed("Shoot"):
		var laser = LASER_SCENE.instantiate()
		var world = get_tree().current_scene
		world.add_child(laser)
		laser.position = position
	pass


func _on_area_entered(area: Area2D) -> void:
	queue_free()
	area.queue_free()
	ship_destroyed.emit()
