@tool
extends Node2D
class_name MultiLine2D

var lines : Dictionary = {}
var _room_list : Dictionary

var room_list : Dictionary:
	get:
		return _room_list

func InitLines( list_of_rooms ):
#{
	_room_list = list_of_rooms
	lines.clear()
	
	for room in room_list:
	#{
		pass
	#}
#}

func UpdateLines( room_id : String ):
#{
	var room = room_list[ room_id ]
	
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
	#{
		# Make sure the destination room is there else skip over it
		if( not room_list.has( door.destination ) ):
			continue;
						
		var dest_room : LayoutRoom = room_list[ door.destination ];
	
		# set up line data
		var door_col = Color.DARK_GRAY
		if( room.layout_doors.has(door.destination) ):
			door_col = room.layout_doors[ door.destination ].color;
			
		var start_pos = room.position;
		var end_pos = dest_room.position
		line_collection[ door.destination ] = {
			"color" : door_col,
			"start" : start_pos,
			"end" : end_pos
		}
		
		# add line data to line collection here:
		
	#}  // end for door
	
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
