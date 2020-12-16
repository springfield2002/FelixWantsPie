extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$SONG.volume_db = -10
	$AnimationPlayer.play("genius 1")
	yield($AnimationPlayer,"animation_finished")
	$Camera2D.position.y = 958.802
	$AnimationPlayer.play("transition")
	yield($AnimationPlayer,"animation_finished")
	$CanvasLayer.layer = 0
	$SONG.volume_db = -30
	$SONG.stream = preload("res://SFX/happy_children_background_music_kids_instrumental_music_by_synthezx_6rHB_3IByoK-gucZXYgw.ogg")
	$SONG.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureRect6_over():
	$AnimationPlayer.play_backwards("transition")
	yield($AnimationPlayer,"animation_finished")
	$Camera2D.position.y = 307.968
	$CanvasLayer.layer = -1
	$AnimationPlayer.play("genius 2")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene("res://instances/you_win2.tscn")
	pass # Replace with function body.
