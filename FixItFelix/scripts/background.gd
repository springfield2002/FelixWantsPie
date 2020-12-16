extends Node2D

export(float) var scroll_speed = 0.1;

func _ready():
	$ParallaxBackground/ParallaxLayer/TextureRect.material.set_shader_param("scroll_speed", scroll_speed);
	pass 
