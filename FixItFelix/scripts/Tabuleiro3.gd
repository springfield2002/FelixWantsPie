extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("open transition")
	yield($AnimationPlayer,"animation_finished")
	$AnimationPlayer.play("to phase 3")
	yield($AnimationPlayer,"animation_finished")
	$AnimationPlayer.play_backwards("open transition")
	yield($AnimationPlayer,"animation_finished")
	$AnimationPlayer.play("final")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene("res://instances/Thanks.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
