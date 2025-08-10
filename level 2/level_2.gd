extends Node
var x = 0
var answer = ""
var chest_opened = 0
var active_chest: Node = null
var questions = [
	{
		"text": "Which mental illness involves mood swings from extreme highs to extreme lows? (Answer in UPPER CASE)
 A) Bipolar Disorder B) Schizophrenia C) OCD D) Depression",
		"answers": ["A"],
		"hint": "The 1st digit is 5"
	},
	{
		"text": "Mental illness only affects adults. (Answer in UPPER CASE)
		A) True B) False",
		"answers": ["B"],
		"hint": "The 2nd digit is 3"
	},
	{
		"text": "What is a common symptom of depression? (Answer in UPPER CASE)
		A) Increased energy B) Loss of appetite C) Persistent sadness or loss of interest D) Excessive talking",
		"answers": ["C"],
		"hint": "The 3rd digit is 1"
	},
]
# Called when the node enters the scene tree for the first time.

func notdone():
	$player/Camera2D/Panel.visible = true
	$player/Camera2D/Panel/Dialogue.text = "You haven't opened all the chests yet"
	$Timer3.start()

func _ready() -> void:
	$player/Camera2D/Panel.visible = false
	$player/Camera2D/LineEdit.visible = false
	$player/Camera2D/LineEdit2.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if chest_opened > 2:
		$door.setdoor(true)
	pass

func call_question(index, chest:Node):
	active_chest = chest
	x = index
	$player/Camera2D/Panel/Dialogue.text = questions[x]["text"]
	$player/Camera2D/Panel.visible = true
	$player/Camera2D/LineEdit.visible = true
	$player.setmove(false)

func _on_line_edit_text_submitted(new_text: String) -> void:
	answer = ", ". join(questions[x]["answers"])
	if new_text == answer:
		$player/Camera2D/Panel/Dialogue.text = "Correct! " + questions[x]["hint"]
		$Timer2.start()
		get_tree().paused = true
		$player/Camera2D/LineEdit.text = ""
	else:
		$Timer.start()
		$player/Camera2D/Panel/Dialogue.text = "Incorrect. Try Again"
		$player/Camera2D/LineEdit.text = ""
	pass # Replace with function body.
	
func _on_timer_timeout() -> void:
	$player/Camera2D/Panel/Dialogue.text = questions[x]["text"]
	$Timer.stop()
	pass # Replace with function body.

func _on_timer_2_timeout() -> void:
	get_tree().paused = false
	$player.setmove(true)
	$player/Camera2D/Panel.visible = false
	$player/Camera2D/LineEdit.visible = false
	chest_opened += 1
	if active_chest.has_node("AnimatedSprite2D"):
		active_chest.get_node("AnimatedSprite2D").play("new_animation")
	$Timer2.stop()
	pass # Replace with function body.

func _on_timer_3_timeout() -> void:
	$player/Camera2D/Panel.visible = false
	$Timer3.stop()
	pass # Replace with function body.

func door():
	$player/Camera2D/Panel/Dialogue.text = "What is the password"
	$player/Camera2D/Panel.visible = true
	$player/Camera2D/LineEdit2.visible = true
	$player.setmove(false)


func _on_line_edit_2_text_submitted(new_text: String) -> void:
	answer = "531"
	if new_text == answer:
		$"wall & floor".modulate = Color(1,1,1)
		$decorate.modulate = Color(1,1,1)
		$"special chest".modulate = Color(1,1,1)
		$"chest 1".modulate = Color(1,1,1)
		$"chest 2".modulate = Color(1,1,1)
		$"chest 3".modulate = Color(1,1,1)
		$player/AnimatedSprite2D.modulate = Color(1,1,1)
		$player/torch.modulate = Color(1,1,1)
		$door.modulate = Color(1,1,1)
		$player/PointLight2D.visible = false
		$player/Camera2D/Panel.visible = false
		$player/Camera2D/LineEdit2.visible = false
		create_tween().tween_property($player/Camera2D, "zoom", Vector2(.4, .4), 1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		create_tween().tween_property($player/Camera2D, "position", Vector2(-720, -700), 1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		await get_tree().create_timer(2.0).timeout
		create_tween().tween_callback(Callable(self, "_go_to_next_scene"))
	else:
		$player/Camera2D/Panel/Dialogue.text = "Password wrong. I guess you will need to restart"
		$player/Camera2D/LineEdit2.text = ""
	pass # Replace with function body.
	
func _go_to_next_scene():
	get_tree().change_scene_to_file("res://outro/outro.tscn")
