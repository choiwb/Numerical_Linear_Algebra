% figure(1)
clear all
r = 0.5; k = 1; N = 100;
t = linspace(1, 100);
y0 = 0.5; y(1) = y0;
for i = 1:N - 1
    y(i+1) = r*y(i)*(1-y(i));
end
figure(1)
subplot(2,2,1)
plot(t,y,'.')
title('r = 0.5')

r = 1.7; k = 1; N = 100;
t = linspace(1, 100);
y0 = 0.5; y(1) = y0;
for i = 1:N - 1
    y(i+1) = r*y(i)*(1-y(i));
end
subplot(2,2,2)
plot(t,y,'.')
title('r = 1.7')

r = 3.2; k = 1; N = 100;
t = linspace(1, 100);
y0 = 0.5; y(1) = y0;
for i = 1:N - 1
    y(i+1) = r*y(i)*(1-y(i));
end
subplot(2,2,3)
plot(t,y,'.')
title('r = 3.2')

r = 3.8; k = 1; N = 100;
t = linspace(1, 100);
y0 = 0.5; y(1) = y0;
for i = 1:N - 1
    y(i+1) = r*y(i)*(1-y(i));
end
subplot(2,2,4)
plot(t,y,'.')
title('r = 3.8')

% figure(2) logistic map
clear all
N = 200; M = 100; y0 = 0.5;
r = linspace(2,4,M);
y = zeros(N,M);
y(1,:) = y0;
for i = 1:N-1
    for j = 1:M
        y(i+1,j) = r(j)*y(i,j)*(1-y(i,j));
    end
end
figure(2)
plot(r,y(90:end,:),'.')
xlabel('r')
ylabel('y')
