/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

var lineColor = make_color_rgb(143,204,203);
draw_set_color(lineColor);

var lineWidth = 4;
var lineLength = 10;
var lineX = room_width/2;
var lineYStart = 4;

for(var i = lineYStart; i < room_width; i += lineLength*2) {
	draw_line_width(lineX,i,lineX,i+lineLength, lineWidth);
}

// Left score

draw_set_font(fntSymtextLarge);
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_set_alpha(0.25)
if(global.leftScore > 0)
	draw_text(room_width/4.0, -30, string(global.leftScore));
if(global.rightScore > 0)
	draw_text(room_width*3.0/4.0, -30, string(global.rightScore));

if(global.rightScore + global.leftScore == 0) {
	draw_set_font(fntSymtextMedium);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center)
	draw_text(room_width/2, room_height/2, "Escape!");


	// Controls
	draw_set_font(fntSymtextSmall);
	draw_set_valign(fa_bottom);

	draw_set_halign(fa_right)
	draw_text(room_width/2, room_height, "Button 1  \nBrake  ");
	draw_set_halign(fa_left)
draw_text(room_width/2, room_height, "  Button 2\n  Boost");
}
draw_set_alpha(1.0)