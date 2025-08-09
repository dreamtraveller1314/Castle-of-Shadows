extends Area2D
var door = false
var ready_to_check = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	ready_to_check = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if not ready_to_check:
		return
	elif door == true:
		get_tree().change_scene_to_file("res://info_page/info_page.tscn")
	else:
		get_parent().notdone() 
	pass # Replace with function body.

func setdoor(x):
	door = x
