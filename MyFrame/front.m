classdef front
    %前向传播返回值类
    properties
        a_cell;%每层每个节点的数值，是前向传播后所得的参数，用来方便计算偏导数
    end
    methods
        function self = front(model,n)
            %model为model类，n为训练集样本数
            self.a_cell= cell(1,model.n_size);
            for a_temp=1:model.n_size
                self.a_cell{a_temp}= zeros(model.n_all(a_temp),n);
              
            end
        end
        
    end
    
end

