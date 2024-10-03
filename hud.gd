extends CanvasLayer

signal start_game

const GAME_OVER_MESSAGE = "Game Over!"
const NEW_GAME_MESSAGE = "Dodge the Creeps"

func show_message(text, hides_after: bool = false):
	$Message.text = text
	$Message.show()
	if not hides_after:
		$MessageTimer.start()

func show_game_over():
	show_message(GAME_OVER_MESSAGE)
	await $MessageTimer.timeout
	
	show_message(NEW_GAME_MESSAGE, true)
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_message_timer_timeout():
	$Message.hide()
	
