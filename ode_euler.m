clear all
t_f = 12;
dt = 0.5;
t = 0:dt:t_f;
g = 9.81; m = 68.1; cd = 0.25;
v = sqrt(g*m/cd)*tanh(sqrt(g*cd/m)*t);
N = floor(t_f/dt);
v_n(1) = 0;
for i = 1:N
    v_n(i+1) = v_n(i) + dt*(g-cd/m*abs(v_n(i))*v_n(i));
end
figure(1)
plot(t,v, 'b', t, v_n, 'ro')
xlabel('Time')
ylabel('Velocity')
title('Comparison of error and numerical solutions')
legend('Exact sol', 'Numerical sol')
