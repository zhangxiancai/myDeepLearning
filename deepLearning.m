function  [w1,w2,b1,b2]=deepLearning(data,y)
%����������ģ�͵ĸ��ݶ��½���
n1=10;n2=10;%ÿ��ڵ���
[n0,m]=size(data);

w1=0.001*rand(n1,n0);w2=0.001*rand(n2,n1);
b1=rand(n1,1);b2=rand(n2,1);%��ֵ
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
    %------------------0ǰ�򴫲�����
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
    dw1=a0*dz1'/m;%����ó˷����˻��õ�� z,a�������ۺ�����ÿ���������ֵ���Ϣ
    db1=sum(dz1,2)/m;
    %-------------------2ȷ��һ�κ��򴫲����ۺ�����ƫ����
    %------------3
    w2=w2-p*dw2';
    b2=b2-p*db2;
    w1=w1-p*dw1';
    b1=b1-p*db1;
    %-------------------3��������
    %--------------------------------------1���򴫲�����
end
% plot([e;e_test]');%��ǰ���
plot(e);



end



function  e=costFunction(a,y)
%���ۺ���
[~,m]=size(y);
e=sum(sum(-(y.*log(a)+(1-y).*log(1-a))))/m;


end



function  dx=dRUL(x)
%��������RUL�ĵ���
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