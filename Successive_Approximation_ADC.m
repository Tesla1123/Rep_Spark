clc
clear
V_in=7.65;
% Voltage Pre Set
V_full=10;
x=[0,0,0,0,0,0,0,0];
y=0;
for i=1:length(x)
    ave=0.5*(V_full+y);
    if V_in>ave
        x(i)=1;
        y=ave;
    else 
        V_full=ave;
        x(i)=0;
    end
end
x