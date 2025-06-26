extends Node2D

@onready var cpu_particles_2d: CPUParticles2D = $CPUParticles2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cpu_particles_2d.one_shot = true
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	queue_free()
