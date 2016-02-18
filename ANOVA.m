%Data for ANOVA
%M x N Matrix representing tests data and tests
%M - number of samples in a test - ROWS
%N - number of tests - COLUMNS 
clc
clear
% Data generation for the test code
m=5;
n=4;
data=[34 37 34 36;
      36 36 37 34;
      34 35 35 37;
      35 37 37 34;
      34 37 36 35]
% data=rand([5 5]); % Random numbers from uniform distribution

%Variations observed 
% 1. With in Group
% 2. Between Group
% Y(i,j) jth observation in gropu i
% $Y_{ij} = \mu + \alpha(between two groups) + Z_{ij}(random)$ 

% All means are equal - Initial Hypothesis

%Sum of squares
x=[];
for i=1:n
    x=[x (sum(data(:,i)))/m];
end
total_mean=sum(x)/n;
y=(data-total_mean).^2;
x=[];
for i=1:n
    x1=sum(y(:,i));
    x=[x x1];
end
SST=sum(x);


%Sum of variations with in groups
o=[];
for i=1:n
    o1=(mean(data(:,i))-total_mean)^2;
    o=[o o1];
end
SSB=m*sum(o);

%Sum of variation within groups
x=[];
y=[];
for i=1:n
    for j=1:m
        q1=(data(j,i)-mean(data(:,i)))^2;
        x=[x q1];
    end
    y=[y sum(x)];
    x=[];
end
SSW=sum(y);

MSB=SSB/(n-1);
MSW=SSW/(m*n-n);
MST=SST/(m*n-1);

F=MSB/MSW

%Power of ANOVA
d=2;
ar=0.05;
q=m*((d^2)/2)/MSW;
a=1-ar;
power=1-ncfcdf(finv(a,n-1,m*n-n),n-1,m*n-n,q)
