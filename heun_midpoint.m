clear all
t_f = 12;
dt = 1;
t = 0:dt:t_f;
g = 9.81; m = 100; cd = 0.25;
v = sqrt(g * m / cd)*tanh(sqrt(g*cd/m)*t);
N = floor(t_f/dt);
v_n = zeros(1,N);
v_n(1) = 0;

% k = 1;
% k = 2;
k = 3;

switch k
    case 1 % euler method 规过 k = 1老 锭
        for i = 1:N
            v_n(i+1) = v_n(i)+dt*(g-cd/m*abs(v_n(i))*v_n(i));
        end
    case 2 % midpoint method 规过 k = 2老 锭
        for i = 1:N
            v_mid = v_n(i)+dt/2*(g-cd/m*abs(v_n(i))*v_n(i));
            v_n(i+1) = v_n(i)+dt*(g - cd/m*abs(v_mid)*v_mid);
        end
    case 3 % heun's method 规过 k = 3 老 锭
        for i = 1:N
        f1 = (g - cd/m*abs(v_n(i))*v_n(i));
        v_1 = v_n(i)+dt*(f1);
        f2 = (g - cd/m*abs(v_1)*v_1); 
        v_n(i+1) = v_n(i)+dt*((f1+f2)/2);
        end
end

figure(k)
plot(t,v,'b',t,v_n,'ro')
xlabel('Time');
ylabel('Velocity');
title('Comparison of exact and numerical solutions')
legend('Exact sol', 'Numerical sol')

Et = abs(v-v_n);
Table = [t 'v' v_n 'Et'];
fprintf('Time Exact Numeric True error\n');
disp(Table)
