extends Area2D

var speed = 600.0
var direction = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	position += direction * speed * _delta

func _on_body_entered(body):
	queue_free()
