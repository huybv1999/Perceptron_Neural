%UCI Machine Learning Repository: Iris Data Set: Petal and sepal length are
%used to determine if species is 1->I.setosa or -1->I.versicolor.
%Data also available at https://en.wikipedia.org/wiki/Iris_flower_data_set

clc;clear all;close all;
a=load('data.txt');
X(:,1)=a(:,1);
X(:,2)=a(:,3);
[n m]=size(X);
X=[X ones(n,1)];
D=a(:,5);
w=zeros(m+1,1);
c=0.1;

%calculation of weight
for j=1:50  %number of iterations
for i=1:n   %number of samples
    x=X(i,:)';
    d=D(i);
    op=w'*x;
    a=sign(op);
    w=w+c*(d-a)*x
end
end

%plotting result
X1=X(D==1,:);
X2=X(D==-1,:);
scatter(X1(:,1),X1(:,2),'r');
hold on; grid on;
scatter(X2(:,1),X2(:,2),'b');
title('Perceptron Learning');
xlabel('Sepal Length [cm]');
ylabel('Petal Length [cm]');
legend('1->I.setosa','-1->I.versicolor');

refline(-w(1)/w(2),-w(3)/w(2));
    

