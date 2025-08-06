@tool
extends Node2D
class_name MultiLine2D

var lines : Dictionary = {}

func InitLines( room_list ):
#{
	lines.clear()
	
	for room in room_list:
	#{
		pass
	#}
#}

func UpdateLines( room : LayoutRoom ):
#{
	# Make sure it's valid
	if( !room ):
		return;
		
	# Since we do have a room, read the door data
	var door_data = room.GetDoorData();
	# If there is no door_data, then no need to update the lines
	if( door_data.size() < 1 ):
		return;
	
	# If it doesn't already have a room entry, then create one
	if( not lines.has( room.id ) ):
		lines[ room.id ] = {}
		
	var line_collection = lines[ room.id ]
	
	# Now we've got both door data, and a lines dictionary, even if empty.
	
	for door in door_data:
		var door_col = room.layout_doors[ door.destination ].color
		var start_pos = room.position
		var end_pos = 
		line_collection[ door.destination ] = {}
	
#}  // end UpdateLines

#func AddLine( start : Vector2, end : Vector2, color : Color = Color.LIGHT_GRAY, line_width : float = 2.0 ):
#{
	#lines.append(
		#{
			#"start" : start,
			#"end" : end,
			#"color" : color,
			#"width" : line_width
		#}
	#)
	#queue_redraw()
	
#} // end add_line

func ClearLines():
	lines.clear()
	queue_redraw()

func _draw():
	pass
	#for line in lines:
		#draw_line( 
		#	line[ "start" ], 
		#	line[ "end" ], 
		#	line[ "color" ], 
		#	line[ "width" ] 
		#)
