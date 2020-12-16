extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("you win")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene("res://scenes/Tabuleiro3.tscn")
	pass # Replace with function body.
