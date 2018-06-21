classdef back
    %后向传播偏导数类
    properties
        dwb_cell;%
    end
    methods
        function self = back(model)
            %model为model类，  
            self.dwb_cell=cell(2,model.n_size-1);%第一行为dw，第二行为db
            for col=1:model.n_size-1
                self.dwb_cell{1,col}=zeros(model.n_all(col+1),model.n_all(col));
                self.dwb_cell{2,col}=zeros(model.n_all(col+1),1);
            end
        end
        
    end
    
end

