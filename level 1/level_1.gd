extends Node
var x = 0
var answer = ""
var chest_opened = 0
var active_chest: Node = null
var questions = [
	{
		"text": "1",
		"answers": ["a"],
		"hint": "The 1st digit is 4"
	},
	{
		"text": "2",
		"answers": ["b"],
		"hint": "The 2nd digit is 7"
	},
	{
		"text": "3",
		"answers": ["c"],
		"hint": "The 3rd digit is 2"
	},
	{
		"text": "4",
		"answers": ["d"],
		"hint": "Here is your torch!"
	},
]
# Called when the node enters the scene tree for the first time.

func notdone():
	$player/Dialogue.visible = true
	$player/Dialogue.text = "You haven't opened all the chests yet"
	$Timer3.start()

func _ready() -> void:
	$player/Dialogue.visible = false
	$player/LineEdit.visible = false
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
	$player/Dialogue.text = questions[x]["text"]
	$player/Dialogue.visible = true
	$player/LineEdit.visible = true
	$player.setmove(false)

func _on_line_edit_text_submitted(new_text: String) -> void:
	answer = ", ". join(questions[x]["answers"])
	if new_text == answer:
		$player/Dialogue.text = "Correct! " + questions[x]["hint"]
		$Timer2.start()
		get_tree().paused = true
		$player/LineEdit.text = ""
		if active_chest == $"special chest":
			torch()
			pass
	else:
		$Timer.start()
		$player/Dialogue.text = "Incorrect. Try Again"
		$player/LineEdit.text = ""
	pass # Replace with function body.
	
func _on_timer_timeout() -> void:
	$player/Dialogue.text = questions[x]["text"]
	$Timer.stop()
	pass # Replace with function body.

func _on_timer_2_timeout() -> void:
	get_tree().paused = false
	$player.setmove(true)
	$player/Dialogue.visible = false
	$player/LineEdit.visible = false
	chest_opened += 1
	if active_chest.has_node("AnimatedSprite2D"):
		active_chest.get_node("AnimatedSprite2D").play("new_animation")
	$Timer2.stop()
	pass # Replace with function body.
	
func torch():
	var torch = $player/torch
	torch.visible = true
	torch.scale = Vector2(3, 3)

func _on_timer_3_timeout() -> void:
	$player/Dialogue.visible = false
	$Timer3.stop()
	pass # Replace with function body.
