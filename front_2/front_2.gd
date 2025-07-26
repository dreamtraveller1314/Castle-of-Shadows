extends Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation = "title"
	$info.visible = true
	$play.visible = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://play/play.tscn")
	pass # Replace with function body.


func _on_info_pressed() -> void:
	get_tree().change_scene_to_file("res://info_page/info_page.tscn")
	pass # Replace with function body.
