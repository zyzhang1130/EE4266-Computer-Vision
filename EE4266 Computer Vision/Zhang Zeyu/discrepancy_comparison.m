AA1=[]
for i = 1:10
    AA1=[AA1,R(i,:)*F*((L(i,:))')]
end
AA2=[]
for i = 1:10
    AA2=[AA2,R(i,:)*FF*((L(i,:))')]
end
AA3=[]
for i = 1:8
    AA3=[AA3,X(i,:)*F3*((Y(i,:))')]
end
    