%vanderpol

clear all;
mu = 1;
f = @(t,y) [y(2); mu*(1-y(1)^2)*y(2)-y(1)];
[t,y] = ode45(f,[0 20], [1 1]);

figure(1)
plot(t,y(:,1),'-',t,y(:,2),'--')
title('Time series')
legend('y', 'dydt')

figure(2)
plot(y(:,1),y(:,2),'m')
title('Phase plane')

mu = 1000;
f = @(t,y) [y(2); mu*(1-y(1)^2)*y(2)-y(1)];
[t,y] = ode23s(f,[0 6000], [1 1]);

figure(3)
subplot(211)
plot(t,y(:,1),'-')
subplot(212)
plot(t,y(:,2),'-')
title('Time series')
legend('y', 'dydt')

figure(4)
plot(y(:,1),y(:,2),'m')
title('Phase plane')
