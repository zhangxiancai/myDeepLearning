classdef train < handle
    properties
        p;%学习率
        n;%样本数
        model;%模型
        data;%训练集,每一列代表一个样本
        front;%每层每个节点的数值
        back;%训练一次计算的偏导数
    end
    
    methods
        function self=train(model,data,p)
            self.p=p;
            self.data=data;
            [~,self.n]=size(data);
            self.model=model;
            self.front=front(self.model,self.n);
            self.back=back(self.model);
        end
        function doTraining(self)
            front_netWork(self);
            back_netWork(self);
        end
        
        function front_netWork(self)
            %前向传播
            
            self.front.a_cell{1}=self.data(1:self.model.n_all(1),:);%训练集自变量集合 A0
            C=ones(1,self.n);
            if self.model.n_size>2
                for numb_layers=2:self.model.n_size-1
                    %                     test1=self.model.wb_cell{1,numb};
                    %                     test2=self.front.a_cell{numb};
                    %                     test3=self.model.wb_cell{2,numb};
                    self.front.a_cell{numb_layers}=EF.RUL(self.model.wb_cell{1,numb_layers-1}*self.front.a_cell{numb_layers-1}+self.model.wb_cell{2,numb_layers-1}*C);%A_numb
                    
                end
            end
            %             test1=self.model.wb_cell{1,self.model.n_size-1};
            %             test2=self.front.a_cell{self.model.n_size};
            %             test3=self.model.wb_cell{2,self.model.n_size-1};
            self.front.a_cell{self.model.n_size}=EF.sigmod(self.model.wb_cell{1,self.model.n_size-1}*self.front.a_cell{self.model.n_size-1}+self.model.wb_cell{2,self.model.n_size-1}*C);
            
        end
        
        function back_netWork(self)
            %后向传播
            Y=self.data(self.model.n_all(1)+1:self.model.n_all(1)+self.model.n_all(self.model.n_size),:);
            %             test1=self.front.a_cell{self.model.n_size};
            dz=self.front.a_cell{self.model.n_size}-Y;
            self.back.dwb_cell{1,self.model.n_size-1}=self.front.a_cell{self.model.n_size-1}*dz'/self.n;
            self.back.dwb_cell{2,self.model.n_size-1}=sum(dz,2)/self.n;
            %             test1=self.model.wb_cell{1,self.model.n_size};
            da=self.model.wb_cell{1,self.model.n_size-1}'*dz;
            
            self.model.wb_cell{1,self.model.n_size-1}=self.model.wb_cell{1,self.model.n_size-1}-self.p*self.back.dwb_cell{1,self.model.n_size-1}';
            self.model.wb_cell{2,self.model.n_size-1}=self.model.wb_cell{2,self.model.n_size-1}-self.p*self.back.dwb_cell{2,self.model.n_size-1};
            for numb_layers=self.model.n_size-1:2
                clear dz;
                dz=da.*EF.dRUL(self.front.a_cell{numb_layers});
                self.back.dwb_cell{1,numb_layers-1}=self.front.a_cell{numb_layers-1}*dz'/self.n;%求和用乘法，乘积用点乘 z,a包含代价函数中每个样本部分的信息
                
                self.back.dwb_cell{2,numb_layers-1}=sum(dz,2)/self.n;
                clear da;
                da=self.model.wb_cell{1,numb_layers}'*dz;
                %                 test1=self.back.dwb_cell{1,numb_layers-1};
                %                 test2=self.model.wb_cell{1,numb_layers-1};
                self.model.wb_cell{1,numb_layers-1}=self.model.wb_cell{1,numb_layers-1}-self.p*self.back.dwb_cell{1,numb_layers-1}';
                self.model.wb_cell{2,numb_layers-1}=self.model.wb_cell{2,numb_layers-1}-self.p*self.back.dwb_cell{2,numb_layers-1};
                
            end
            
            
        end
        
    end
    
end
