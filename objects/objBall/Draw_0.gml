/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

draw_self();

// Draw arrow in direction we're going

var arrowLength = 20;
var arrowSize = 5;
var arrowColor = make_color_rgb(209,180,140);

var currentDirection = point_direction(0, 0, speedX, speedY);

var vX = lengthdir_x(arrowLength, currentDirection);
var vY = lengthdir_y(arrowLength, currentDirection);

draw_set_color(arrowColor);
draw_arrow(x, y, x+vX, y+vY, arrowSize);
