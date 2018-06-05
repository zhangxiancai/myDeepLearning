function [data,y]=loadData()

dat=csvread('mnist_train.csv',50000,0);%载入第50000至60000行数据,28X28手写数字10000条
data=dat(:,2:785)';
y=dat(:,1)'*0.1;


for i=1:28
up=28*(i-1)+1;
do=28*i;
image_i=data(up:do,1);
if i==1
  image=image_i;
end
image=[image,image_i];
end
imshow(image');

end