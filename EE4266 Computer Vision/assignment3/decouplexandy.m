[m,n]=size(Y_rFFT)
x=[];
y=[];
for i=1:m
    x=[x;real(Y_rFFT)];
    y=[y;imag(Y_rFFT)];
end

x=abs(x);
y=abs(y);
maxx=max(x);
maxy=max(y);
new=zeros(1600, 961);
for i=1:m
    new(ceil(x(i)),ceil(y(i)))=1;
end
    