classdef DataUtil
    
    methods(Static)
        function data=loadData()
            %����ѵ������
            dat=csvread('../mnist_train.csv',50000,0);%�����50000��60000������,28X28��д����10000��
            [n,s]=size(dat);
            data=dat(:,2:785)';
            y=zeros(10,n);
            y_1= dat(:,1)';
            
            for col=1:n
                y(y_1(col)+1,col)=1;%�任���ֵ
            end
            data=[data;y];
            
        end
        
        function x=changeOneImageToX(fileName)
            %��������ͼ����������
            test_gray=imread(fileName);
            test_gray=test_gray';
            for col=1:28
                x(28*(col-1)+1:28*col)=test_gray(:,col);
            end
            x=double(x');
        end
        
        function changeXToImage(X,fileName)
            %������ת��ΪͼƬ������
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

