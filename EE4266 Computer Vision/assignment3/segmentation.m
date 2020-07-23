imagen = imread('C:\Users\Lenovo\Documents\NTU course materials\EEE\EE4266 Computer Vision\aaa.jpeg');
imagen=rgb2gray(imagen);
threshold = graythresh(imagen);
imagen =~imbinarize(imagen,threshold);
imagen = bwareaopen(imagen,30);
pause(1)
%%Show image binary image
figure(2)
imshow(~imagen);
[L Ne]=bwlabel(imagen);
propied=regionprops(L,'BoundingBox');
hold on
for n=1:size(propied,1)
rectangle('Position',propied(n).BoundingBox,'EdgeColor','r','LineWidth',1)
end
hold off
pause (1)