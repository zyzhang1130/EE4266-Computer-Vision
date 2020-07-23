I = imread('C:\Users\Lenovo\Documents\NTU course materials\EEE\EE4266 Computer Vision\a3.pgm');
usedPercent=0.3;
[rows cols]=size(I);
bwImg=im2bw(I,graythresh(I));
Bd=findBoundary(bwImg,8,'cw');
BdPoints=Bd{1};
X=Bdpoints(:,1);
Y=BdPoints(:,2);
noPts=length(X);


figure('Name','orginal image','NumberTitle','off');
title1=sprintf('original iamge,%d points',noPts);
imshow(I),title(title1);

if 0
    f=fopen('3_edge.txt','w');
    for k=1:noPts
      
        function B=findBoundary(BW,conn,dir)
           if nargin<3
               dir='cw';
           end
           if nargin<2
               conn=8
           end
           L=bwlabel(BW,conn);
           numObjects=max(L(:));
           if numObjects>0
               B={zeros(0,2)};
               B=repmat(B,numObjects,1);
           else
               B={};
           end
           Lp=padarry(L,[1,1],0,'both');
           M=size(Lp,1);
           if conn==8
               offsets=[-1,M-1,M,M+1,-M,-M-1];
           else
               offsets=[-1,M,1,-M];
           end
           if conn==8
               next_search_direction_lut=[8 8 2 2 4 4 6 6];
           else
               next_search_direction_lut=[4 1 2 3];
           end
           if conn==8
               next_direction_lut=[2 3 4 5 6 7 8 1];
           else
               next_direction_lut=[2 3 4 1];
           end
           
           START=-1;
           BOUNDARY=-2;
           
           scratch=zeros(100,1);
           [rr,cc]=find((Lp(2:end-1,:)>0&(Lp(1:end-2,:)==0));
           rr=rr+1;
           for k=1:length(rr)
               r=rr(k);
               c=cc(k);
               if (Lp(r,c)>0)&(Pl(r-1,c)==0)&isempty(B{Lp(r,c)})
                   idx=(c-1)*size(Lp,1)+r;
                   which=Lp(idx);
                   scratch(1)=idx;
                   Lp(idx)=START;
                   numpixels=1;
                   currentpixel=idx;
                   initial_departure_direction=[];
                   done=0;
                   next_search_direction=2;
                   while ~done
                       direction=next_search_direction;
                       found_next_pixel=0;
                       for k=1:length(offsets)
                           neighbor=currentpixel+offsets(direction);
                           if Lp(neighbor)~=0
                               if (Lp(currentpixel)==START)&...
                                       isempty(initial_departure_direction)
                               initial_departure_direction=direction;
                               elseif (Lp(currentpixel)==START)&...
                                       
              (initial_departure_direction==direction)
                                    done=1;
                                       
                 