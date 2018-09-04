function x = change(IaA,IbA,IcA,IdA,IaB,IbB,IcB,IdB,alpha,beta,x,N)

p01_1 = (1-IaB)*IaA*(1-IbB)*IbA;
p03_1 = IaB*IbB*(1-IaA)*(1-IbA);
p0_1_1 = (1-IaA)*(1-IbA);
p0_3_1 = (1-IaB)*(1-IbB);

p12_1 = IaA^2*IbA^2*IcA*IdA;
p10_1 = (1-IaA)^2*(1-IbA)^2*(1-IcA)*(1-IdA);

p34_1 = IaB^2*IbB^2*IcB*IdB;
p30_1 = (1-IaB)^2*(1-IbB)^2*(1-IcB)*(1-IdB);

p_10_1 = IaA*IbA*IcA^2*IdA^2;

p_30_1 = IaB*IbB*IcB^2*IdB^2;

p21_1 = (1-IcA)*(1-IdA);

p43_1 = (1-IcB)*(1-IdB);

neigh = [-1,-1;0,-1;1,-1;1,0;1,1;0,1;-1,1;-1,0];

for i = 1:N
    for j = 1:N
	n1 = 0;
	n2 = 0;
	n3 = 0;
	n4 = 0;
	n_1 = 0;
	n_3 = 0;
        temp = rand;
        for k = 1:8
            i2 = i + neigh(k,1);
            if i2 < 1
                i2 = N;
            elseif i2 > N
                i2 = 1;
            end
            j2 = j + neigh(k,2);
            if j2 < 1
                j2 = N;
            elseif j2 > N
                j2 = 1;
            end
            if x(i2,j2) == -1
                n_1 = n_1 + 1;
            elseif x(i2,j2) == 1
                n1 = n1 + 1;
            elseif x(i2,j2) == 2
                n2 = n2 + 1;
            elseif x(i2,j2) == 3
                n3 = n3 + 1;
            elseif x(i2,j2) == 4
                n4 = n4 + 1;
            elseif x(i2,j2) == -3
                n_3 = n_3 + 1;
            end
        end
        poly1 = alpha*((n2-n4)/4+(n1+n_3-n_1-n3)/8);
        poly2 = beta*((n4-n2)/4+(n3+n_1-n1-n_3)/8);
        p01 = p01_1 + poly1;
        p03 = p03_1 + poly2;
        p0_1 = p0_1_1 - poly1;
        p0_3 = p0_3_1 - poly2;

        p12 = p12_1 + poly1;
        p10 = p10_1 - poly1;
	
        p34 = p34_1 + poly2;
        p30 = p30_1 - poly2 ;
	
        p_10 = p_10_1;
	
        p_30 = p_30_1;
	
        p21 = p21_1;
        p43 = p43_1;
	
        if x(i,j) == 0   % ????0 ????????????
            if temp <= p01
                x(i,j) = 1;
            elseif temp > p01 && temp <= p01 + p03
                x(i,j) = 3;
            elseif temp > p01 + p03 && temp <= p01 + p03 + p0_1
                x(i,j) = -1;
            elseif temp > p01 + p03 + p0_1 && temp <= p01 + p03 + p0_1 + p0_3
                x(i,j) = -3;
            else 
                x(i,j) = 0;
            end
        elseif x(i,j) == 1
            if temp <= p12
                x(i,j) = 2;
            elseif temp > p12 && temp <= p12 + p10
                x(i,j) = 0;
            else
                x(i,j) = 1;
            end
        elseif x(i,j) == 3
            if temp <= p34
                x(i,j) = 4;
            elseif temp > p34 && temp <= p34 + p30
                x(i,j) = 0;
            else
                x(i,j) = 3;
            end
        elseif x(i,j) == -1
            if temp <= p_10
                x(i,j) = 0;
            else
                x(i,j) = -1;
            end
        elseif x(i,j) == -3
            if temp <= p_30
                x(i,j) = 0;
            end
        elseif x(i,j) == 2
            if temp <= p21
                x(i,j) = 1;
            else
                x(i,j) = 2;
            end
        elseif x(i,j) == 4
            if temp <= p43
                x(i,j) = 3;
            else 
                x(i,j) = 4;
            end
        end
    end
end

                
                