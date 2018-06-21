classdef train < handle
    properties
        p;%ѧϰ��
        n;%������
        model;%ģ��
        data;%ѵ����,ÿһ�д���һ������
        front;%ÿ��ÿ���ڵ����ֵ
        back;%ѵ��һ�μ����ƫ����
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
            %ǰ�򴫲�
            
            self.front.a_cell{1}=self.data(1:self.model.n_all(1),:);%ѵ�����Ա������� A0
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
            %���򴫲�
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
                self.back.dwb_cell{1,numb_layers-1}=self.front.a_cell{numb_layers-1}*dz'/self.n;%����ó˷����˻��õ�� z,a�������ۺ�����ÿ���������ֵ���Ϣ
                
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
