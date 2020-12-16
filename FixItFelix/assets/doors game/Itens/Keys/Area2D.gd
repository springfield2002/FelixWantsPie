extends Area2D
onready var world = get_node("res://world.tscn")
var click = 0

func _on_Area2D_input_event(viewport, event, shape_idx):
	
	if event is InputEventMouseButton:
		if event.is_pressed():
			
			world.value = 1
			click = click + 1
			print(click)
	pass # Replace with function body.
