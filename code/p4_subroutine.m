%this script define a function get_area_cir which get the area of a circile
%with input radius. When we define a varibale which is an int, call the
%function with it, it will give the area of a circle with the radius of the
%variable.

r = 2
area_A = get_area_cir(2)
%area_B = p4_sub_program(2,4)


function [area] = get_area_cir(radius)
area = radius*radius * pi;
end