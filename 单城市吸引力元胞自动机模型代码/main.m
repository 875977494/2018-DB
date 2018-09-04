% main????

Ia = 0.34;  
Ib = 0.36;
Ic = 0.35;
Id = 0.33;
alpha = 0.7;

iteration = 300; 
N = 100;
t = 0.2;
x = create_check(N);
h = show_check(NaN,x,t);

n_1 = zeros(1,N);
n_2 = zeros(1,N);
for i = 1:iteration
    i
    if i == 35
        pause(60)
    end
    x = change(Ia,Ib,Ic,Id,alpha,x,N);
    n_1(1,i) = length(find(x == 1)) / N^2;
    n_2(1,i) = length(find(x == 2)) / N^2;
    h = show_check(h,x,t);
end

figure(2)
plot(1:iteration,n_1)

figure(3)
plot(1:iteration,n_2)






