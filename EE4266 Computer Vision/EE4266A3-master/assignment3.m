close all
clc

imagen = imread('a3.pgm');
imagenorig = imagen;
%imagen=rgb2gray(imagen);
threshold = graythresh(imagen);
imagen =~imbinarize(imagen,0.3);
imagen = bwareaopen(imagen,30);
pause(1)

keep =5;

%%Show image binary image
%figure(2)
%imshow(~imagen);
[L Ne]=bwlabel(imagen);
propied=regionprops(L,'BoundingBox');
[ml,nl]=size(L);
kl=4;
L2=zeros(ml,nl,kl);
L2(:,:,1)=L;
for k=2:kl
for i = 2:ml-1
    for j = 2:nl-1
        if L2(i,j,k-1)~=0
            L2(i,j,k)=L2(i,j,k-1);
            L2(i+1,j,k)=L2(i,j,k-1);
            L2(i,j+1,k)=L2(i,j,k-1);
            L2(i-1,j,k)=L2(i,j,k-1);
            L2(i,j-1,k)=L2(i,j,k-1);
            L2(i+1,j+1,k)=L2(i,j,k-1);
            L2(i+1,j-1,k)=L2(i,j,k-1);
            L2(i-1,j+1,k)=L2(i,j,k-1);
            L2(i-1,j-1,k)=L2(i,j,k-1);
        end
    end
end
end
% hold on
% for n=1:size(propied,1)
% rectangle('Position',propied(n).BoundingBox,'EdgeColor','r','LineWidth',1)
% end
% hold off
% pause (1)

detection=[];
meann=[];
flag=0;
[m,n]=size(L);
x=3;
L3=L2(:,:,kl);
threshold = graythresh(L3);
imagen =imbinarize(L3,threshold);
imagen = bwareaopen(imagen,30);
%imshow(~imagen);
[L Ne]=bwlabel(imagen);
propied=regionprops(L,'BoundingBox');
hold on
% for n=1:size(propied,1)
% rectangle('Position',propied(n).BoundingBox,'EdgeColor','r','LineWidth',1)
% end
hold off
pause (1)
for i=1:m
    for k=1:n
        if L(i,k)==x
            countour=bwtraceboundary(L,[i, k], 'W');
            flag=1;
            break
        end
    end
    if flag==1
            break
    end
end
[p,q]=size(countour);
coupling=[];
for i=1:p
    coupling=[coupling;countour(i,1)+1i*countour(i,2)];
end

%plot(countour(:,2),countour(:,1),'g','LineWidth',1);
freq3=fft(coupling);

freq3=[freq3(2:keep);freq3(end-keep+1:end)];
freq3=freq3/freq3(1);
freq3=abs(freq3);
%freq3=freq3/exp(1i*angle(freq3(1)));
space3=ifft(freq3);
[a,b]=size(space3);
decoupled=zeros(a,2);
for i=1:a
    decoupled(i,1)=real(space3(i));
    decoupled(i,2)=imag(space3(i));
end
%plot(decoupled(:,2),decoupled(:,1),'g','LineWidth',1);


for x=1:max(max(L))
flag=0;
[m,n]=size(L);
for i=1:m
    for k=1:n
        if L(i,k)==x
            countour=bwtraceboundary(L,[i, k], 'W');
            flag=1;
            break
        end
    end
    if flag==1
            break
    end
end
%plot(countour(:,2),countour(:,1),'g','LineWidth',1);
[p,q]=size(countour);
coupling=[];
for i=1:p
    coupling=[coupling;countour(i,1)+1i*countour(i,2)];
end
freq=fft(coupling);
%freq=freq/exp(1i*angle(freq(1)));

freq=[freq(2:keep);freq(end-keep+1:end)];
freq=freq/freq(1);
freq=abs(freq);
meann=[meann,std(abs(freq./freq3))];
if std(abs(freq./freq3))<0.66
    detection=[detection,x];
end
end
imshow(imagenorig);
hold on
[p,q]=size(detection);
for i=1:q
rectangle('Position',propied(detection(i)).BoundingBox,'EdgeColor','r','LineWidth',1)
end
hold off
pause (1)