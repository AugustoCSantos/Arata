extends CharacterBody2D


const SPEED = 250.0
const JUMP_FORCE = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_jump := false

@onready var animation := $Anim as AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_FORCE
		is_jump = true
	elif is_on_floor():
		is_jump = false
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
		animation.scale.x = direction 
		if !is_jump:
			animation.play("Run")
	elif is_jump:
		animation.play("Jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("Idle")
	move_and_slide()
func _on_hurtbox_body_entered(body):
	if body.is_in_group("enemies"):
		queue_free()

