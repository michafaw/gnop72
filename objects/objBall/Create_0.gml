/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

initialSpeed = 2.5
initialDirection = 45;

boostMultiplier = 1.5;
brakesMultiplier = 0.5;

rotationAnglesPerTap = 13


// Internals
speedX = lengthdir_x(initialSpeed, initialDirection);
speedY = lengthdir_y(initialSpeed, initialDirection);