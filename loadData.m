function [data,y]=loadData()
%����ѵ������
dat=csvread('mnist_train.csv',50000,0);%�����50000��60000������,28X28��д����10000��
[n,s]=size(dat);
data=dat(:,2:785)';
y=zeros(10,n);
y_1= dat(:,1)';

for col=1:n
    y(y_1(col)+1,col)=1;%�任���ֵ
end
 

for m=1:100
    for i=1:28
        up=28*(i-1)+1;
        do=28*i;
        image_i=data(up:do,m);
        if i==1
            image=image_i;
        end
        image=[image,image_i];%���ǰ100������ͼƬ
    end
    
    subplot(10,10,m);
    imshow(image');
end

end