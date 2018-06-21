classdef model
    %模型类
    properties %(SetAccess=private)
        n_all;%n维行向量，n为层数，值为各层节点数
        n_size;%层数,从第一层算起，不以第零层算起
        wb_cell;%参数数组
    end
    
    methods
        function self = model(n_all)
            [~,self.n_size]=size(n_all);
            self.n_all=n_all;
            self.wb_cell=cell(2,self.n_size-1);%第一行为w，第二行为b
            for col=1:self.n_size-1
                self.wb_cell{1,col}=0.001*rand(n_all(col+1),n_all(col));%构造w，以下一层数为行数，上一层数为列数
                self.wb_cell{2,col}=rand(n_all(col+1),1);
            end
        end
        %         function setW(w,temp)
        %             if size(self.wb_cell{1,temp})==size(w)
        %                 self.wb_cell{1,temp}=w;
        %             else
        %                 error('w格式不对');
        %             end
        %         end
        %         function setB(b,temp)
        %             if size(self.wb_cell{2,temp})==size(b)
        %                 self.wb_cell{2,temp}=b;
        %             else
        %                 error('b格式不对');
        %             end
        %         end
        function y=netWork(self,x)
            %神经网络模型，x y为列向量
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