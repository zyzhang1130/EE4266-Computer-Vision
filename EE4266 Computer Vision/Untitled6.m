[m,n]=size(countour);
count2=[];
for i=1:m
    count2=[count2;countour(i,1)+j*countour(i,2)];
end