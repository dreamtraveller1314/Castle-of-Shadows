extends Area2D
var chestopened = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.animation = "default"
	$AnimatedSprite2D.visible = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if chestopened == false:
		get_parent().call_question(3, self)		
		chestopened = true
	pass # Replace with function body.
