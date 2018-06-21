
classdef testTrain < handle

    properties
        train;%
        e;%��¼ÿ��ѵ�����ۺ���ֵ
    end
    methods
        function self = testTrain(train)
            self.train=train;
         
        end
        
        function trainSomeTimes(self,times)
            %ѵ�����
          ee=zeros(1,times);
            for i=1:times
                self.train.doTraining();
                ee(i)=self.costFunction();
            end
            self.e=ee;
            
        end
        
        function drawCostMap(self)
            %��ͼ
            plot(self.e);
            title('���ۺ���ֵ�仯ͼ');xlabel('ѵ������'),ylabel('���ۺ���ֵ')
            
        end
        
        function  e=costFunction(self)
            %���ۺ���
            Y=self.train.data(self.train.model.n_all(1)+1:self.train.model.n_all(1)+self.train.model.n_all(self.train.model.n_size),:);
            A=self.train.front.a_cell{self.train.model.n_size};
            e=sum(sum(-(Y.*log(A)+(1-Y).*log(1-A))))/self.train.n;
 
        end
        
    end
    
end

