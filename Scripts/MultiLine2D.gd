@tool
extends Node2D
class_name MultiLine2D

var lines : Array = []

func AddLine( start : Vector2, end : Vector2, color : Color = Color.LIGHT_GRAY, line_width : float = 2.0 ):
#{
	lines.append(
		{
			"start" : start,
			"end" : end,
			"color" : color,
			"width" : line_width
		}
	)
	queue_redraw()
	
#} // end add_line

func ClearLines():
	lines.clear()
	queue_redraw()

func _draw():
	for line in lines:
		draw_line( 
			line[ "start" ], 
			line[ "end" ], 
			line[ "color" ], 
			line[ "width" ] 
		)
