classdef model
    %ģ����
    properties %(SetAccess=private)
        n_all;%nά��������nΪ������ֵΪ����ڵ���
        n_size;%����,�ӵ�һ�����𣬲��Ե��������
        wb_cell;%��������
    end
    
    methods
        function self = model(n_all)
            [~,self.n_size]=size(n_all);
            self.n_all=n_all;
            self.wb_cell=cell(2,self.n_size-1);%��һ��Ϊw���ڶ���Ϊb
            for col=1:self.n_size-1
                self.wb_cell{1,col}=0.001*rand(n_all(col+1),n_all(col));%����w������һ����Ϊ��������һ����Ϊ����
                self.wb_cell{2,col}=rand(n_all(col+1),1);
            end
        end
        %         function setW(w,temp)
        %             if size(self.wb_cell{1,temp})==size(w)
        %                 self.wb_cell{1,temp}=w;
        %             else
        %                 error('w��ʽ����');
        %             end
        %         end
        %         function setB(b,temp)
        %             if size(self.wb_cell{2,temp})==size(b)
        %                 self.wb_cell{2,temp}=b;
        %             else
        %                 error('b��ʽ����');
        %             end
        %         end
        function y=netWork(self,x)
            %������ģ�ͣ�x yΪ������
            a=x;
            if self.n_size>2
                for numb=1:self.n_size-2
                    clear z;
                    z=self.wb_cell{1,numb}*a+self.wb_cell{2,numb};
                    clear a;
                    a=EF.RUL(z);
                end
            end
            clear z;
            z=self.wb_cell{1,self.n_size-1}*a+self.wb_cell{2,self.n_size-1};
            clear a;
            a=EF.sigmod(z);
            y=a;
        end
        

    end
    
end