function [area] = get_area_tri(length,width) %this function can calculate the area of a triangle with input length and width.
area = length * width/4;                  %any script in the same folder can call it, no need to import.
                                          % note it should be called with
                                          % the file name, which is the
                                          % p4_sub_program.