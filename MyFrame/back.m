classdef back
    %���򴫲�ƫ������
    properties
        dwb_cell;%
    end
    methods
        function self = back(model)
            %modelΪmodel�࣬  
            self.dwb_cell=cell(2,model.n_size-1);%��һ��Ϊdw���ڶ���Ϊdb
            for col=1:model.n_size-1
                self.dwb_cell{1,col}=zeros(model.n_all(col+1),model.n_all(col));
                self.dwb_cell{2,col}=zeros(model.n_all(col+1),1);
            end
        end
        
    end
    
end

