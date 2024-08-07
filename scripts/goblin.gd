extends CharacterBody2D

const SPEED = 1800.0
const JUMP_VELOCITY = -400.0

@onready var wall_detector := $wall_detector as RayCast2D
@onready var texture := $texture as Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction := 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if wall_detector.is_colliding():
		direction *= -1
		wall_detector.scale.x *= -1
		
	if direction == -1:
		texture.flip_h = true
	else:
		texture.flip_h = false
	
	velocity.x = direction * SPEED * delta

	move_and_slide()
