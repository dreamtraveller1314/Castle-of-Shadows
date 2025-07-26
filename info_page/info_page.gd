extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("1")
	$AnimatedSprite2D.set_frame(0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	if $AnimatedSprite2D.frame < 5:
		$AnimatedSprite2D.set_frame($AnimatedSprite2D.frame + 1)
	else:
		$AnimatedSprite2D.set_frame(0)
	pass # Replace with function body.


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://front_2/front_2.tscn")
	pass # Replace with function body.
