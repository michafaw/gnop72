/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;


var oldX = x;
var oldY = y;

var old_bbox_left = bbox_left;
var old_bbox_right = bbox_right;
var old_bbox_top = bbox_top;
var old_bbox_bottom = bbox_bottom;

/////////////
/// Controls
/////////////

var boostOn = false;
var brakesOn = false;
var additionalDirection = 0;

if(keyboard_check(ord("X"))) {
	show_debug_message("X Pressed");
	boostOn = true;
}

if(keyboard_check(ord("Z"))) {
	show_debug_message("Z Pressed");	
	brakesOn = true;
}

if(keyboard_check_pressed(vk_right)) {
	show_debug_message("Right Pressed");	
	additionalDirection = -rotationAnglesPerTap;
}

if(keyboard_check_pressed(vk_left)) {
	show_debug_message("Left Pressed");	
	additionalDirection = rotationAnglesPerTap;
}


if(additionalDirection != 0) {
	
	var newSpeed = point_distance(0, 0, speedX, speedY);
	var newDirection = point_direction(0, 0, speedX, speedY);
	newDirection += additionalDirection;
	
	speedX = lengthdir_x(newSpeed, newDirection);
	speedY = lengthdir_y(newSpeed, newDirection);
}
	
	
	
	
/////////////
/// Movement
/////////////

if(boostOn) {
	x += speedX*boostMultiplier;
	y += speedY*boostMultiplier;
} else if(brakesOn) {
	x += speedX*brakesMultiplier;
	y += speedY*brakesMultiplier;
} else {
	x += speedX;
	y += speedY;
}




///////////////
/// Collisions
///////////////

var collided = false;

// Walls
if(bbox_left <= 0) {
	//speedX = abs(speedX);
	//collided = true;
	global.rightScore += 1;
	alarm[0] = 1;
} else if(bbox_right >= room_width) {
	//speedX = -abs(speedX);
	//collided = true;
	global.leftScore += 1;
	alarm[0] = 1;
}

if(bbox_top <= 0) {
	speedY = abs(speedY);
	collided = true;
} 
else if(bbox_bottom >= room_height) {
	speedY = -abs(speedY);
	collided = true;
}




// Paddles

var collideFromLeft = false;
var collideFromRight = false;
var collideFromTop = false;
var collideFromBottom = false;

var paddle;
paddle = instance_nearest(x, y, objPaddleParent);
if(place_meeting(x, y, paddle)) {
	// From Left
	if(old_bbox_right < paddle.bbox_left && bbox_right >= paddle.bbox_left)
		collideFromLeft = true;
	// From Right
	if(old_bbox_left >= paddle.bbox_right && bbox_left < paddle.bbox_right)
		collideFromRight = true;
		
	// From Top
	if(old_bbox_bottom < paddle.bbox_top && bbox_bottom >= paddle.bbox_top)
		collideFromTop = true;
		
	// From Bottom
	if(old_bbox_top >= paddle.bbox_bottom && bbox_top < paddle.bbox_bottom)
		collideFromBottom = true;
}

if(collideFromRight) {
	speedX = abs(speedX);
	collided = true;
} else if(collideFromLeft) {
	speedX = -abs(speedX);
	collided = true;
}

if(collideFromBottom) {
	speedY = abs(speedY);
	collided = true;
} 
else if(collideFromTop) {
	speedY = -abs(speedY);
	collided = true;
}



if(collided) {
	x = oldX;
	y = oldY;
}
