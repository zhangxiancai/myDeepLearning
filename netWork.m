function [x,a1,a2,z1,z2]=netWork(x,w1,w2,b1,b2)
%2��������
[n0,m]=size(x);
c=ones(1,m);
z1=w1*x+b1*c;%����㵽���ز�ı任1
a1=RUL(z1);%����㵽���ز�ı任2

z2=w2*a1+b2*c;%���ز㵽�����ı任1
a2=excitationFunction(z2);%���ز㵽�����ı任2

end
function y=excitationFunction(x)
%��������
y=1./(1+exp(-x));
end
function  x=RUL(x)
%��������
if x<0
    x=0;
end

end