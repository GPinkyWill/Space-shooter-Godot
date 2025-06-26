extends Area2D

@export var speed = 40
@export var armor = 3


func _process(delta: float) -> void:
	position.x -= speed * delta


func _on_body_entered(body: Node2D) -> void:
	body.queue_free()
	armor -= 1
	if armor <= 0:
		var world = get_tree().current_scene
		world.score += 10
		queue_free()
		
