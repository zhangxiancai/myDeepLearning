function z=doConv(x,w,s,p)
%卷积运算,x w做卷积运算，s为步长

[~,f]=size(w);[nh,nw]=size(x);
d=(f-1)/2;
z=zeros(nh-2*d,nw-2*d);
z_nh=nh
for z_row=1:nh-2*d
    for z_col=1:nw-2*d
       buff=x(z_row:z_row+2*d,z_col:z_col+2*d);
       z(z_row,z_col)=sum(sum(buff.*w));
    end
end
end