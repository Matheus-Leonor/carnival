extends CharacterBody2D

const SPEED = 300.0

@export var bullet_scene: PackedScene

func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("mover_direita"):
		direction.x += 1
	if Input.is_action_pressed("mover_esquerda"):
		direction.x -= 1
	if Input.is_action_pressed("mover_baixo"):
		direction.y += 1
	if Input.is_action_pressed("mover_cima"):
		direction.y -= 1
	
	velocity = direction.normalized() * SPEED
	move_and_slide()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			atirar()

func atirar():
	var bullet = bullet_scene.instantiate()
	var dir = (get_global_mouse_position() - global_position).normalized()
	bullet.position = global_position + dir * 50
	bullet.direction = dir
	get_parent().add_child(bullet)
