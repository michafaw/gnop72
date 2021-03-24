/// @description Insert description here
// if (live_call()) return live_result;
// if (live_call(argument0, argument1)) return live_result; // For 2 arg scripts
if (live_call()) return live_result;

if(keyboard_check_pressed(vk_escape))
	room_restart();
	
global.worldSpeedMult = 1.0;
global.paddleSpeedMult = 0.25;
global.ballSpeedMult = 0.75;

