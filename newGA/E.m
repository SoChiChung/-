function [E] = E(x)
%E ������ֵ
%   �˴���ʾ��ϸ˵��
global data ;
data = getData();
    RP = x*data.asset;
    RT=data.tao;
    E = (RP(:,1)+RP(:,2))/2+(RP(:,4)-RP(:,3))/6-(RT(:,1)+RT(:,2))/2+(RT(:,4)-RT(:,3))/6;
end

