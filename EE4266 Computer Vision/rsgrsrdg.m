[m,n]=size(countour)
x=[];
y=[];
 
    x=countour(:,1);
    y=countour(:,2);


x=abs(x);
y=abs(y);
maxx=max(x);
maxy=max(y);
new=zeros(1600, 961);
for i=1:m
    new(ceil(x(i)),ceil(y(i)))=1;
end
    