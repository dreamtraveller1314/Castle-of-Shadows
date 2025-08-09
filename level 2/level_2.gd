extends Node
var x = 0
var answer = ""
var chest_opened = 0
var active_chest: Node = null
var questions = [
	{
		"text": "What is mental health? (Answer in UPPER CASE)
 A) Physical well-being B) Emotional, psychological, and social well-being C) Financial well-being D) None of the above",
		"answers": ["B"],
		"hint": "The 1st digit is 4"
	},
	{
		"text": "What is the most common mental disorder worldwide?  (Answer in UPPER CASE)
		A) Bipolar Disorder B) PTSD C) Depression D) OCD",
		"answers": ["C"],
		"hint": "The 2nd digit is 7"
	},
	{
		"text": "Anxiety disorders are a type of mental illness.  (Answer in UPPER CASE)
		A) True B) False",
		"answers": ["A"],
		"hint": "The 3rd digit is 2"
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
	$player/torch.visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if chest_opened > 3:
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
	answer = "472"
	if new_text == answer:
		$player/Camera2D/Panel.visible = false
		$player/Camera2D/LineEdit2.visible = false
		create_tween().tween_property($player/Camera2D, "zoom", Vector2(.4, .4), 1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		create_tween().tween_property($player/Camera2D, "position", Vector2(-618, -618), 1.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		create_tween().tween_callback(Callable(self, "_go_to_next_scene"))
	pass # Replace with function body.
