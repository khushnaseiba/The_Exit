extends Node3D


@export var markers: Array[Marker3D] = []

func teleport_to_marker(marker_index: int,degree:int) -> void:
	if marker_index >= 0 and marker_index < markers.size():
		var chosen_marker = markers[marker_index]
		
		if chosen_marker:
			global_position = chosen_marker.global_position
			
			global_rotation_degrees.y = degree
			


func _input(event: InputEvent) -> void:
	# Press the Spacebar (or ui_accept) to test teleporting to the first marker in your list
	if event.is_action_pressed("ui_accept"):
		teleport_to_marker(0,0)
