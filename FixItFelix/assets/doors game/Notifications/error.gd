extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("anim")
	yield(get_tree().create_timer(1.0), "timeout")
	queue_free()
	pass 
