extends CharacterBody2D

const SPEED = 5000.0
const JUMP_VELOCITY = -400.0

@onready var wall_detector := $wall_detector as RayCast2D
@onready var texture := $texturaOlho as Sprite2D
@onready var animation := $animOlho as AnimatedSprite2D

var direction := -1

func _physics_process(delta):
		
	if wall_detector.is_colliding():
		direction *= -1
		wall_detector.scale.x *= -1
		
	if direction == -1:
		texture.flip_h = true
	else:
		texture.flip_h = false

	velocity.x = direction * SPEED * delta

	move_and_slide()
