% pendulum

f = @(t,y) [y(2); -(9.81/0.6)*sin(y(1))];
[t,y] = ode45(f, [0 20], [pi/8 0]);

figure(1)
plot(t,y(:,1), '-', t,y(:,2), '--')
title('Time series')
legend('y', 'dydt')

figure(2)
plot(y(:,1),y(:,2),'m')
title('Phase plane')