extends CharacterBody2D


var SPEED = -150
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y = gravity * delta
	velocity.x = SPEED
	$Sprite.play("Moving")
	move_and_slide()

func _on_head_body_entered(_body):
	if _body.name == "Player":
		$Sprite.play("Dying")
		self.queue_free()
	


func _on_plat_edge_left_2_body_entered(body):
	if body.name == "Blue_slime":
		SPEED = 150

func _on_plat_edge_right_2_body_entered(body):
	if body.name == "Blue_slime":
		SPEED = -150
