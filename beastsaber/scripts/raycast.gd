extends XRController3D

@export var ray_length = 1.0
@export var enabled = true

var origin = global_position
var dir = global_basis.z*-1
var end = origin + (dir * ray_length)
var query = PhysicsRayQueryParameters3D.create(origin, end)
var collision_enabled = true

# Reference to the line renderer child node
var line_renderer



func _physics_process(delta):
	var space_state = get_world_3d().direct_space_state
	
	origin = global_position
	dir = global_basis.z*-1
	end = origin + (dir * ray_length)
	query = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_areas = collision_enabled
	
	
	if collision_enabled:
		var result = space_state.intersect_ray(query)
		if result:
			print("Collision with ", result.collider.name)
			var name = result.collider.name
			if name == "blue":
				$hit.play()
				result.collider.queue_free()
		
		
	$"rightbeam".points[0] = origin
	$"rightbeam".points[1] = end
func _on_button_pressed(name):	
	if (name == "ax_button"): 
		$"rightbeam".visible = !$"rightbeam".visible
		collision_enabled = !collision_enabled
		if collision_enabled:
			$onsaberright.play()
		query.collide_with_areas = collision_enabled
		print("right button press")
