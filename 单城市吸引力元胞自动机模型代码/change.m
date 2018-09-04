function [x,pcd,pcb,pc,poly] = change(Ia,Ib,Ic,Id,alpha,x,N)
pcb_1 = Ia * Ib;
pcd_1 = (1 - Ia) * (1 - Ib) * (1 - Ic)^2 * (1 - Id)^2;
pbc_1 = (1 - Ia)^2 * (1 - Ib)^2 * (1 - Ic) * (1 - Id);
pba_1 = Ia^2*Ib^2*Ic*Id;
pab_1 = (1 - Ic)*(1 - Id);
pdc_1 = Ia*Ib*Ic^2*Id^2;

neigh = [-1,-1;0,-1;1,-1;1,0;1,1;0,1;-1,1;-1,0];

for i = 1:N
    for j = 1:N
        nb = 0;
        na = 0;
        nd = 0;
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
                nd = nd + 1;
            elseif x(i2,j2) == 1
                nb = nb + 1;
            elseif x(i2,j2) == 2
                na = na + 1;
            end
        end
        poly = (alpha/8)*(na + nb - nd);
        pcb = pcb_1 + poly;
        pcd = pcd_1 - poly;
        pba = pba_1 + poly;
        pbc = pbc_1 - poly;
        pab = pab_1 + poly;
        %pdc = pdc_1;
        pdc = poly;
        if x(i,j) == -1 
            if temp <= pdc
                x(i,j) = 0;
            else 
                x(i,j) = -1;
            end
        elseif x(i,j) == 0
            if temp <= pcb
                x(i,j) = 1;
            elseif temp > pcb && temp <= pcb + pcd
                x(i,j) = -1;
            else 
                x(i,j) = 0;
            end
        elseif x(i,j) == 1
            if temp <= pba
                x(i,j) = 2;
            elseif temp > pba && temp <= pba + pbc
                x(i,j)  = 0;
            else 
                x(i,j) = 1;
            end
        elseif x(i,j) == 2
            if temp <= pab 
                x(i,j) = 1;
            else 
                x(i,j) = 0;
            end
        end
    end
end

                
                