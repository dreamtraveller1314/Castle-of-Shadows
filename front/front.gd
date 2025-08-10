extends Node2D
var instruction = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.animation = "title"
	$info.visible = false
	$play.visible = false
	get_tree().paused = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if instruction == 1:
		$AnimatedSprite2D.animation = "talk 1"
	if instruction == 2:
		$AnimatedSprite2D.animation = "talk 2"
	if instruction == 3:
		$AnimatedSprite2D.animation = "title"
		$AnimatedSprite2D.position.y = 200
		$Button.visible = false
		$info.visible = true
		$play.visible = true
	pass

func _on_button_pressed() -> void:
	instruction += 1
	pass # Replace with function body.


func _on_info_pressed() -> void:
	get_tree().change_scene_to_file("res://info_page/info_page.tscn")
	pass # Replace with function body.


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://level 1/level 1.tscn")
	pass # Replace with function body.
