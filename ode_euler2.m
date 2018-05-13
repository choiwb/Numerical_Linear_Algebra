clear all
t_f = 2*pi;
dt = 0.2;
t = 0:dt:t_f;
N = floor(t_f/dt);
y1 = zeros(1,N);
y2 = zeros(1,N);
k = 2;
switch k
    case 1
        m = 1; k = 1; b = 0;
        y_ex = cos(t) + sin(t);
        
        y1(1) = 1; y2(1) = 1;
        for k = 1:N
            y1(i+1) = y1(i) + dt*(y2(i));
            y2(i+1) = y2(i) + dt* (-k/m*y1(i) - b/m*y2(i));
        end
        
        figure(1)
        plot(t,y_ex, 'b', t, y1, 'ro')
        xlabel('Time')
        ylabel('Displacement')
        title('Comparison of exact and numerical solutions')
        legend('Exact sol', 'Numerical sol')
        
    case 2
        m = 1; k = 1; b = 1;
        c1 = 1; c2 = sqrt(3)/3; beta = sqrt(3)/2;
        y_ex = exp(-0.5*t).*(c1*cos(beta*t) + c2*sin(beta*t));
        
        y1(1) = 1; y2(1) = 0;
        for i = 1:N
            y1(i+1) = y1(i) + dt*(y2(i));
            y2(i+1) = y2(i) + dt*(-k/m*y1(i) - b/m*y2(i));
        end
        
        figure(2)
        plot(t, y_ex, 'b', t, y1, 'ro')
        xlabel('Time')
        ylabel('Displacement')
        title('Comparison of exact and numerical solutions')
        legend('Exact sol', 'Numerical sol')
end
        