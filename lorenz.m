sigma = 10; beta = 8/3; rho = 28;
f = @(t,a) [-sigma*a(1) + sigma*a(2); rho*a(1) - a(2) - a(1)*a(3); -beta*a(3) + a(1)*a(2)];
[t,a] = ode45(f,[0 100], [1 1 1]);

figure(1)
plot(t,a(:,1), ':', t,a(:,2), '--',t,a(:,3), '-')
title('Time series')
legend('x','y','z')

figure(2)
plot3(a(:,1),a(:,2),a(:,3),'m');
title('3D Phase plane')

figure(3)
subplot(311)
plot(a(:,1),a(:,2))
title('2D Phase plane x-y')
subplot(312)
plot(a(:,1),a(:,3));
title('2D Phase plane x-z')
subplot(313)
plot(a(:,2),a(:,3))
title('2D Phase plane y-z')