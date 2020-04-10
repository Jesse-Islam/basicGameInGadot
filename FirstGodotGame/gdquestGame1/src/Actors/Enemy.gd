extends "res://src/Actors/Actor.gd"

func _ready():
	set_physics_process(false)
	velocity.x = -speed.x

func _on_Area2D_stompDetector_body_entered(body:PhysicsBody2D):
	if body.global_position.y > get_node("Area2D_stompDetector").global_position.y:
		return 
	get_node("CollisionShape2D").disabled = true
	queue_free()
func _physics_process(delta):
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y += gravity * delta
	velocity.y = move_and_slide(velocity,FLOOR_NORMAL).y



