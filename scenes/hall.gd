extends Area3D

@onready var light : Light3D = $SpotLight3D
@onready var door = $"../exitroomdoor2"

func _ready() -> void:
	light.visible = true
	
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body) -> void:
	if body.name=="player":
		light.visible = false
		door.teleport_to_marker(2,180)
