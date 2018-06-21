classdef DataUtil
    
    methods(Static)
        function data=loadData()
            %载入训练数据
            dat=csvread('../mnist_train.csv',50000,0);%载入第50000至60000行数据,28X28手写数字10000条
            [n,s]=size(dat);
            data=dat(:,2:785)';
            y=zeros(10,n);
            y_1= dat(:,1)';
            
            for col=1:n
                y(y_1(col)+1,col)=1;%变换输出值
            end
            data=[data;y];
            
        end
        
        function x=changeOneImageToX(fileName)
            %载入数字图像用来测试
            test_gray=imread(fileName);
            test_gray=test_gray';
            for col=1:28
                x(28*(col-1)+1:28*col)=test_gray(:,col);
            end
            x=double(x');
        end
        
        function changeXToImage(X,fileName)
            %将数字转换为图片并保存
            for i=1:28
                up=28*(i-1)+1;
                do=28*i;
                image_i=X(up:do);
                if i==1
                    image=image_i;
                else
                image=[image,image_i];   
                end
            end
            imwrite(uint8(image'),fileName,'png');
        end
    end
    
end

