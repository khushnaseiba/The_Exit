extends StaticBody3D

@export var exitdoorposition: Array[Marker3D]
var was_visible := true
var move_coldown := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if was_visible and not move_coldown:
		move_door()
	was_visible = visible

func teleport_to(position_marker:Marker3D):
	global_position = position_marker.global_position
	global_rotation = position_marker.global_rotation

func teleport_to_index(index: int):
	if index >= 0 and index < exitdoorposition.size():
		global_position = exitdoorposition[index].global_position
		global_rotation = exitdoorposition[index].global_rotation
		
func move_door():
	move_coldown = true
	
	var random_index = randi_range(0, exitdoorposition.size()-1)
	teleport_to_index(random_index)
	
	await get_tree().create_timer(2.0).timeout
	move_coldown = false
	
