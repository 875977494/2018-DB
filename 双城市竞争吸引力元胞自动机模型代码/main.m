IaA = 0.33;  
IbA = 0.35;
IcA = 0.36;
IdA = 0.37;

IaB = 0.36;  
IbB = 0.38;
IcB = 0.41;
IdB = 0.39;

alpha = 0.45;
beta  = 0.8;
iteration = 400; 
N = 100;
t = 0.0001;
x = create_check(N);
h = show_check(NaN,x,t);

n_1A = zeros(1,iteration);
n_2A = zeros(1,iteration);
n_1B = zeros(1,iteration);
n_2B = zeros(1,iteration);
for i = 1:iteration
    i
    if i == 150
        pause(60)
    end
    x = change(IaA,IbA,IcA,IdA,IaB,IbB,IcB,IdB,alpha,beta,x,N);
    n_1A(1,i) = length(find(x == 1)) / N^2;
    n_2A(1,i) = length(find(x == 2)) / N^2;
    n_1B(1,i) = length(find(x == 3)) / N^2;
    n_2B(1,i) = length(find(x == 4)) / N^2;
    h = show_check(h,x,t);
end

figure(2)
plot(1:iteration,n_1A,'r')
hold on
plot(1:iteration,n_1B,'b')

figure(3)
plot(1:iteration,n_2A,'r')
hold on
plot(1:iteration,n_2B,'b')






