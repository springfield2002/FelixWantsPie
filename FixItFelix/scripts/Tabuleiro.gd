extends Node2D

func _ready():
	$AnimationPlayer.play("open transition")
	yield($AnimationPlayer,"animation_finished")
	$AnimationPlayer.play("begin")
	yield($AnimationPlayer,"animation_finished")
	$AnimationPlayer.play("looking for pie")
	yield($AnimationPlayer,"animation_finished")
	$AnimationPlayer.play("to phase 1")
	yield($AnimationPlayer,"animation_finished")
	$AnimationPlayer.play_backwards("open transition")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene("res://instances/world.tscn")
