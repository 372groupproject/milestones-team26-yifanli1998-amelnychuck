pic=imread('climber.tiff');
close all
gray_pic=rgb2gray(pic);
gray_pic=gray_pic*(255/248);
figure;
imshow(pic);
Gx=conv2(gray_pic,[-1,1],'same');
% figure;
% imshow(Gx);

Gy=conv2(gray_pic,[-1;1],'same');

% figure;
% imshow(Gy);

G=sqrt(Gx.^2+Gy.^2);
G=G*255/330;
max(G(:))

%  figure;
%  imshow(G/255);


for x=1:364
    for y=1:236
        if (G(x,y)>10)
            G(x,y)=255;
        else 
            G(x,y)=0;
        end
    end
end
% figure;imshow(G)

sigma=2;
halfwid=3*sigma;
[xx,yy]=meshgrid(-halfwid:halfwid,-halfwid:halfwid);
tmp=exp(-1/(2*sigma^2)*(xx.^2+yy.^2));
tmp=tmp./25;

gx=exp(-1/(2*sigma^2)*xx.^2);
hy=exp(-1/(2*sigma^2)*yy.^2);
fxy=conv2(gray_pic,gx*hy,'same');

figure;
imshow(fxy/255/25);


figure;
surf(tmp);

GB=conv2(gray_pic,tmp,'same');
figure;

imshow(GB/255);
GBx=conv2(GB,[-1,1],'same');
GBy=conv2(GB,[-1;1],'same');
GBsum=sqrt(GBx.^2+GBy.^2);
GBsum=GBsum*255/123;
max(GBsum(:))
figure;
imshow(GBsum/255);
for x=1:364
    for y=1:236
        if (GBsum(x,y)>10)
            GBsum(x,y)=255;
        else 
            GBsum(x,y)=0;
        end
    end
end
imshow(GBsum/255);
combine_x=tmp;
combine_y=tmp;
% 
% combine_kernel=[-0.00391,-0.01563,-0.02344,-0.01563,-0.00391;
%     -0.01563,-0.06250,-0.09375,-0.06250,-0.01563;
%     -0.02344,-0.09375,1.85980,-0.09375,-0.02344;
%     -0.01563,-0.06250,-0.09375,-0.06250,-0.01563;
%     -0.0391,-0.01563,-0.02344,-0.01563,-0.00391];
combine_x(1:25,13:25)=-combine_x(1:25,13:25);
combine_x(1:12,12)=-combine_x(1:12,12);
combine_y(13:25,1:25)=-combine_y(13:25,1:25);
combine_y(12,1:12)=-combine_x(12,1:12);
combine_GB_x=conv2(GB,combine_x,'same');
combine_GB_y=conv2(GB,combine_y,'same');
combine_GB=sqrt(combine_GB_x.^2+combine_GB_y.^2);
figure;


for x=1:364
    for y=1:236
        if (combine_GB(x,y)>10)
            combine_GB(x,y)=255;
        else 
            combine_GB(x,y)=0;
        end
    end
end
imshow(combine_GB/255);





