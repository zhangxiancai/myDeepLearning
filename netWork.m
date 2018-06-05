function [x,a1,a2,z1,z2]=netWork(x,w1,w2,b1,b2)
%2层神经网络
[n0,m]=size(x);
c=ones(1,m);
z1=w1*x+b1*c;%输出层到隐藏层的变换1
a1=RUL(z1);%输出层到隐藏层的变换2

z2=w2*a1+b2*c;%隐藏层到输出层的变换1
a2=excitationFunction(z2);%隐藏层到输出层的变换2

end
function y=excitationFunction(x)
%激励函数
y=1./(1+exp(-x));
end
function  x=RUL(x)
%激励函数
if x<0
    x=0;
end

end