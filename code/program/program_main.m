clc;
clear all;
img = imread('climber.tiff');
img = double(img);
size(img)
img = img./(max(max(img)))*255;
%imshow(img)
img_size = size(img);
filter_y = [-1;0;1];

%change the img from gay to black and white.
q1 = zeros(img_size);
for i = 1:img_size(1)
    for j = 1:img_size(2)
            q1(i,j,:) = get_mag_gra(img,i,j);
        end
end
q1 = q1/248*255;  
%imshow(uint8(q1));

%Set a threshold for rgb values, than change all value greater than this
%valur to 255, else,0.
threshold = 15;
q2 = zeros(img_size);
for i = 1:img_size(1)
    for j = 1:img_size(2)
        if q1(i,j) <= threshold
            q2(i,j,:) = 0;
        else
            q2(i,j,:) =  255;
        end
    end
end
%imshow(uint8(q2))

%make the image blurry by Gaussian blurry.
sigma = 2;
size_3 = 9;
middle = 5;
A = zeros(size_3,size_3);
for i = 1:size_3
    for j = 1:size_3
        A(i,j) = exp(-((i-5)^2+(j-5)^2)/(sigma^2));
    end
end
A = A/sum(sum(A));
q3 = conv2(img(:,:,1),A,'same');
%imshow(uint8(q3))
 figure;
 surf(A);

%4
q4 = zeros(img_size);
for i = 1:img_size(1)
    for j = 1:img_size(2)
            q4(i,j,:) = get_mag_gra(q3,i,j);
        end
end
q4 = q4*5;
% figure;
%imshow(uint8(q4));
q4_1 = zeros(img_size);
for i = 1:img_size(1)
    for j = 1:img_size(2)
        if q4(i,j) <= threshold
            q4_1(i,j,:) = 0;
        else
            q4_1(i,j,:) =  255;
        end
    end
end
% imshow(uint8(q4_1))
        

%change the magnitude of blurry
sigma = 4;
size_5 = 9;
middle = 5;
filter_x = [-1 0 1];
A = zeros(size_5,size_5);
% A(5,4:6) = filter_x;
for i = 1:size_5
    for j = 1:size_5
        A(i,j) = exp(-((i-5)^2+(j-5)^2)/(sigma^2));
    end
end
A = A/sum(sum(A));
new_x = conv2(filter_x,A);
new_y = conv2(filter_y,A);
Gx=conv2(img(:,:,1),new_x,'same');
Gy=conv2(img(:,:,1),new_y,'same');
G=sqrt(Gx.^2+Gy.^2);
% figure;
% imshow(uint8(G*5))

%1D convolution to the image
filter_1 = get_filter(21,2);
filter_2 = filter_1';
new_img = conv2(filter_1,filter_2,img(:,:,1));
imshow(uint8(new_img))

%%%Functions
function [dx] = get_partial_x(img,x,y)
filter_x = [1; 0; -1];
if x == 1
    x1 = 0;
else
    x1 = img(x-1,y);
end
if x == 364
    x3 = 0;
else
    x3 = img(x+1,y);
end
x2 = img(x,y);
dx = dot([x1 x2 x3],filter_x);

end


function [dy] = get_partial_y(img,x,y)
filter_y = [1 0 -1];
if y == 1
    y1 = 0;
else
    y1 = img(x,y-1);
end
if y == 236
    y3 = 0;
else
    y3 = img(x,y+1);
end
y2 = img(x,y);
dy = dot([y1 y2 y3],filter_y);

end

function [magnitude] = get_mag_gra(img,x,y)
dx = get_partial_x(img,x,y);
dy = get_partial_y(img,x,y);

magnitude = sqrt((dx.*dx) + (dy.*dy));
end

function [filter] = get_filter(size,sigma)
for i = 1:size
        filter(i) = exp((-(i-0.5*(size+1))^2)/(2*(sigma^2)));
end
filter = filter/(sum(filter))
end



% function [dx] = get_partial_x_2(img,x,y)
% new_x = [ -0.0056;0;0.0056];
% if x == 1
%     x1 = 0;
% else
%     x1 = img(x-1,y);
% end
% if x == 364
%     x3 = 0;
% else
%     x3 = img(x+1,y);
% end
% x2 = img(x,y);
% dx = dot([x1 x2 x3],new_x);
% 
% end
% 
% 
% function [dy] = get_partial_y_2(img,x,y)
% new_y = [ -0.0056;0;0.0056];
% if y == 1
%     y1 = 0;
% else
%     y1 = img(x,y-1);
% end
% if y == 236
%     y3 = 0;
% else
%     y3 = img(x,y+1);
% end
% y2 = img(x,y);
% dy = dot([y1 y2 y3],new_y);
% 
% end
% 
% function [magnitude] = get_mag_gra_2(img,x,y)
% dx = get_partial_x_2(img,x,y);
% dy = get_partial_y_2(img,x,y);
% 
% magnitude = sqrt((dx.*dx) + (dy.*dy));
% end






















