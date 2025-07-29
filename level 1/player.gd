extends CharacterBody2D

const SPEED = 200

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("default")
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("default")
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("new_animation")
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("default_1")
	else:
		$AnimatedSprite2D.animation = ("new_animation_1")
		
		
	
	var dir = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	velocity = dir.normalized() * SPEED
	move_and_slide()
