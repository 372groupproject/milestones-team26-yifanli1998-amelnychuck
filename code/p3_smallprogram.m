%this function read in a image and return a matrix which have the same size
%as the input image, but contains the value of magnitude of RGB value changes in
% every pixel of the original image. the output 'magnitude' is a matrix in
% uin8(positive and max value is 255) interger and have the same size as
% input, also can be shown as an image.
function [magnitude] = get_mag_gra(img,x,y)
dx = get_partial_x(img,x,y);
dy = get_partial_y(img,x,y);

magnitude = sqrt((dx.*dx) + (dy.*dy));
end

function [dx] = get_partial_x(img,x,y)
img_size = size(img);
filter_x = [1; 0; -1];
if x == 1
    x1 = 0;
else
    x1 = img(x-1,y);
end
if x == img_size(1)
    x3 = 0;
else
    x3 = img(x+1,y);
end
x2 = img(x,y);
dx = dot([x1 x2 x3],filter_x);

end


function [dy] = get_partial_y(img,x,y)
img_size = size(img);
filter_y = [1 0 -1];
if y == 1
    y1 = 0;
else
    y1 = img(x,y-1);
end
if y == img_size(2)
    y3 = 0;
else
    y3 = img(x,y+1);
end
y2 = img(x,y);
dy = dot([y1 y2 y3],filter_y);

end
