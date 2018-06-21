function [data,y]=loadData()
%载入训练数据
dat=csvread('mnist_train.csv',50000,0);%载入第50000至60000行数据,28X28手写数字10000条
[n,s]=size(dat);
data=dat(:,2:785)';
y=zeros(10,n);
y_1= dat(:,1)';

for col=1:n
    y(y_1(col)+1,col)=1;%变换输出值
end
 

for m=1:100
    for i=1:28
        up=28*(i-1)+1;
        do=28*i;
        image_i=data(up:do,m);
        if i==1
            image=image_i;
        end
        image=[image,image_i];%输出前100张数字图片
    end
    
    subplot(10,10,m);
    imshow(image');
end

end