
%载入数字图像用来测试
test_gray=rgb2gray(imread('3.png'));
test_gray=test_gray';
for col=1:28
    test_last(28*(col-1)+1:28*col,1)=test_gray(col,:);
end
test_last=double(test_last);

for i=1:28
    up=28*(i-1)+1;
    do=28*i;
    image_i=test_last(up:do,1);
    if i==1
        image=image_i;
    end
    image=[image,image_i];%
end
imshow(image);