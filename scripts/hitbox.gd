extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		Global.score += 100
		owner.queue_free()
