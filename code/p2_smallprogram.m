%This function can calculate the root mean squre of 2 image's rgb matrix,
%the lower the rms be, the more close the two image are.
% This function need to be called at other script, and the output is the
% RMS of two different RGB matrix.
function RMS = get_rms(image1, image2)

R1 = im2double(image1(:,:,1))*255;
G1 = im2double(image1(:,:,2))*255;
B1 = im2double(image1(:,:,3))*255;

R2 = im2double(image2(:,:,1))*255;
G2 = im2double(image2(:,:,2))*255;
B2 = im2double(image2(:,:,3))*255;

image_size  = size(image1);
count       = 0;
sum         = 0;
for i = 1 : image_size(1)
    for j = 1 : image_size(2)
        if ((image1(i,j,1) + image1(i,j,2) + image1(i,j,3)) >= 10 ...
                && (image2(i,j,1) + image2(i,j,2) + image2(i,j,3)) >= 10) %ignore dark pixels
            count = count + 1;
            r1 = R1(i,j) / ((R1(i,j) + G1(i,j) + B1(i,j)));
            r2 = R2(i,j) / ((R2(i,j) + G2(i,j) + B2(i,j)));
            g1 = G1(i,j) / ((R1(i,j) + G1(i,j) + B1(i,j)));
            g2 = G2(i,j) / ((R2(i,j) + G2(i,j) + B2(i,j)));
            sum = sum + (r1 - r2).^2 + (g1 - g2).^2;
        end
    end
end
RMS = sqrt(sum / count);
end