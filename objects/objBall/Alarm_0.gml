/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

initialSpeed = 2
initialDirection = choose(-45, 45, 135, 225)

// Internals
speedX = lengthdir_x(initialSpeed, initialDirection);
speedY = lengthdir_y(initialSpeed, initialDirection);

x = room_width/2;
y = room_height/2;