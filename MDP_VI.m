clear
s = [0,0,0;0,0,0;0,0,0;0,-1,1];
u = zeros(4,3);
action = ['a','a','a';'a','a','a';'a','a','a';'a','a','a'];
aa = '';
c = 0;
while(true)
    for i=1:4
        for j=1:3
            if (((i==2) && (j==2)) || ((i==4) && (j==3)) || ((i==4) && (j==2)))
                continue;
            end
            U = [i,j+1;i-1,j;i+1,j];
            L = [i-1,j;i,j-1;i,j+1];
            D = [i,j-1;i+1,j;i-1,j];
            R = [i+1,j;i,j+1;i,j-1];
            for k=1:3
                if (U(k,1) == 0 || U(k,2) == 0)
                    U(k,1:2) = [i,j];
                end
                if (U(k,1) == 2 && U(k,2) == 2)
                    U(k,1:2) = [i,j];
                end
                if (U(k,1) > 4)
                    U(k,1:2) = [i,j];
                end
                if (U(k,2) > 3)
                    U(k,1:2) = [i,j];
                end
                if (L(k,1) == 0 || L(k,2) == 0)
                    L(k,1:2) = [i,j];
                end
                if (L(k,1) == 2 && L(k,2) == 2)
                    L(k,1:2) = [i,j];
                end
                if (L(k,1) > 4)
                    L(k,1:2) = [i,j];
                end
                if (L(k,2) > 3)
                    L(k,1:2) = [i,j];
                end
                if (D(k,1) == 0 || D(k,2) == 0)
                    D(k,1:2) = [i,j];
                end
                if (D(k,1) == 2 && D(k,2) == 2)
                    D(k,1:2) = [i,j];
                end
                if (D(k,1) > 4)
                    D(k,1:2) = [i,j];
                end
                if (D(k,2) > 3)
                    D(k,1:2) = [i,j];
                end
                if (R(k,1) == 0 || R(k,2) == 0)
                    R(k,1:2) = [i,j];
                end
                if (R(k,1) == 2 && R(k,2) == 2)
                    R(k,1:2) = [i,j];
                end
                if (R(k,1) > 4)
                    R(k,1:2) = [i,j];
                end
                if (R(k,2) > 3)
                    R(k,1:2) = [i,j];
                end
            end
            a = zeros(1,4);
            a(1) = a(1) + 0.8*s(U(1,1),U(1,2)) + 0.1*(s(U(2,1),U(2,2))) + 0.1*(s(U(3,1),U(3,2)));
            a(2) = a(2) + 0.8*s(L(1,1),L(1,2)) + 0.1*(s(L(2,1),L(2,2))) + 0.1*(s(L(3,1),L(3,2)));
            a(3) = a(3) + 0.8*s(D(1,1),D(1,2)) + 0.1*(s(D(2,1),D(2,2))) + 0.1*(s(D(3,1),D(3,2)));
            a(4) = a(4) + 0.8*s(R(1,1),R(1,2)) + 0.1*(s(R(2,1),R(2,2))) + 0.1*(s(R(3,1),R(3,2)));
            if ((a(1) == a(2)) && (a(2) == a(3)) && (a(3) == a(4)) && (a(4) == a(1)))
                x = 1;
                y = 1;
            end
            if ((a(1) ~= a(2)) || (a(2) ~= a(3)) || (a(3) ~= a(4)) || (a(4) ~= a(1)))
                [x,y] = find(a == max(a));
            end
            u(i,j) = 0.9*a(x,y)-0.04;
            u(4,3) = 1;
            u(4,2) = -1;
            if (y == 1)
                aa(i,j) = "U";
            end
            if (y == 2)
                aa(i,j) = "L";
            end
            if (y == 3)
                aa(i,j) = "D";
            end
            if (y == 4)
                aa(i,j) = "R";
            end
        end
    end
    if (norm(s - u) < 0.005)
        break;
    end
    s = u;
    action = aa;
    c = c + 1;
    fprintf("iteration = " + c + "\n")
    fprintf("action = \n")
    for j=3:-1:1
        for i=1:4
            fprintf(action(i,j))
        end
        fprintf("\n")
    end
    fprintf("utility = \n")
    for j=3:-1:1
        for i=1:4
            fprintf("%f   ",s(i,j));
        end
        fprintf("\n")
    end
end