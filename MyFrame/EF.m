classdef EF
 
    methods(Static)
              function   x=RUL(x)
            %��������RUL
            [nn,m]=size(x);
            for r=1:nn
                for c=1:m
                    if x(r,c)<0
                        x(r,c)=0;
                    end
                end
            end
        end
        function y=sigmod(x)
            %��������sigmod
            y=1./(1+exp(-x));
        end
        
        function  dx=dRUL(y)
            %��������RUL�ĵ���
            [nnn,m]=size(y);
            dx=zeros(nnn,m);
            for r=1:nnn
                for c=1:m
                    if y(r,c)>0
                        dx(r,c)=1;
                    end
                end
            end
            
            
        end
        
    end
    
end

