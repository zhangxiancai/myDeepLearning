classdef front
    %ǰ�򴫲�����ֵ��
    properties
        a_cell;%ÿ��ÿ���ڵ����ֵ����ǰ�򴫲������õĲ����������������ƫ����
    end
    methods
        function self = front(model,n)
            %modelΪmodel�࣬nΪѵ����������
            self.a_cell= cell(1,model.n_size);
            for a_temp=1:model.n_size
                self.a_cell{a_temp}= zeros(model.n_all(a_temp),n);
              
            end
        end
        
    end
    
end

