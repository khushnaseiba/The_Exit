extends Area3D

var player_enter = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_enter and Input.is_action_just_pressed("interact"):
		print("yeeeeeeeeee")


func _on_area_3d_body_entered(body) -> void:
	print("hi")
	if body.name == "player":
		print("HI")
		player_enter = true
