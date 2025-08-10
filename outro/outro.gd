extends Node2D
var outro = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.animation = "1"
	$Button.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if outro == 1:
		$AnimatedSprite2D.animation = "2"
	if outro == 2:
		$AnimatedSprite2D.animation = "3"
	if outro == 3:
		$AnimatedSprite2D.animation = "4"
	if outro == 4:
		$AnimatedSprite2D.animation = "5"
	if outro == 5:
		$AnimatedSprite2D.animation = "6"
		$Button2.visible = false
		$Button.visible = true
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://front_2/front_2.tscn")
	pass # Replace with function body.

func _on_button_2_button_up() -> void:
	outro += 1
	pass # Replace with function body.
