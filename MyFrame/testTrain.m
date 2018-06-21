
classdef testTrain < handle

    properties
        train;%
        e;%记录每次训练代价函数值
    end
    methods
        function self = testTrain(train)
            self.train=train;
         
        end
        
        function trainSomeTimes(self,times)
            %训练多次
          ee=zeros(1,times);
            for i=1:times
                self.train.doTraining();
                ee(i)=self.costFunction();
            end
            self.e=ee;
            
        end
        
        function drawCostMap(self)
            %画图
            plot(self.e);
            title('代价函数值变化图');xlabel('训练次数'),ylabel('代价函数值')
            
        end
        
        function  e=costFunction(self)
            %代价函数
            Y=self.train.data(self.train.model.n_all(1)+1:self.train.model.n_all(1)+self.train.model.n_all(self.train.model.n_size),:);
            A=self.train.front.a_cell{self.train.model.n_size};
            e=sum(sum(-(Y.*log(A)+(1-Y).*log(1-A))))/self.train.n;
 
        end
        
    end
    
end

