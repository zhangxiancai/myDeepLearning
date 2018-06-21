function  [w1,w2,b1,b2]=deepLearning(data,y)
%两层神经网络模型的负梯度下降法
n1=10;n2=10;%每层节点数
[n0,m]=size(data);

w1=0.001*rand(n1,n0);w2=0.001*rand(n2,n1);
b1=rand(n1,1);b2=rand(n2,1);%初值
p=0.0001;

e=zeros(1,1000);
%----------for test
% e_test=zeros(1,1000);
% dat=csvread('mnist_test.csv');
% data_test=dat(:,2:785)';
% y_test=dat(:,1)'*0.1;
%----------for test
for i=1:1000
    %-------------0
    [a0,a1,a2,z1,z2]=netWork(data,w1,w2,b1,b2);
    %------------------0前向传播过程
    e(i)=costFunction(a2,y);
    %------for test1
    %      [~,~,a2_test,~,~]=netWork(data_test,w1,w2,b1,b2);
    %     e_test(i)=costFunction(a2_test,y_test);
    %------for test1
    %-------------------2 1
    dz2=a2-y;
    dw2=a1*dz2'/m;
    db2=sum(dz2,2)/m;
    da1=w2'*dz2;
    
    dx=dRUL(z1);
    dz1=da1.*dx;
    dw1=a0*dz1'/m;%求和用乘法，乘积用点乘 z,a包含代价函数中每个样本部分的信息
    db1=sum(dz1,2)/m;
    %-------------------2确定一次后向传播代价函数的偏导数
    %------------3
    w2=w2-p*dw2';
    b2=b2-p*db2;
    w1=w1-p*dw1';
    b1=b1-p*db1;
    %-------------------3修正参数
    %--------------------------------------1后向传播过程
end
% plot([e;e_test]');%蓝前红后
plot(e);



end



function  e=costFunction(a,y)
%代价函数
[~,m]=size(y);
e=sum(sum(-(y.*log(a)+(1-y).*log(1-a))))/m;


end



function  dx=dRUL(x)
%激励函数RUL的导数
[n,m]=size(x);
dx=zeros(n,m);
for r=1:n
    for c=1:m
        if x(r,c)>=0
            dx(r,c)=1;
        end
    end
end


end