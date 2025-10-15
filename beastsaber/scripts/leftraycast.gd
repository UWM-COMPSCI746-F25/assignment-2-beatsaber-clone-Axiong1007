extends XRController3D

@export var ray_length = 10.0
@export var enabled = true

# Reference to the line renderer child node
var line_renderer



func _physics_process(delta):
	var space_state = get_world_3d().direct_space_state
	
	var origin = global_position
	var dir = global_basis.z*-1
	var end = origin + (dir * ray_length)
	var query = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_areas = true
	var result = space_state.intersect_ray(query)
	
	if result:
		print("Collision with ", result.collider.name)
		
		
	$"leftbeam".points[0] = origin
	$"leftbeam".points[1] = end
func _on_button_pressed(name):	
	if (name == "ax_button"): 
		$"leftbeam".visible = !$"leftbeam".visible
		print("left button press")
	
