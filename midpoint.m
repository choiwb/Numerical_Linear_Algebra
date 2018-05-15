function [t,y] = midpoint(dydt,tspan,y0,h)
% [t,y] = midpoint(dydt,tspan,y0,h):
% uses the midpoint method to integrate an ODE
% input:
% dydt = name of the M-file that evaluates the ODE
% tspan = [ti, tf] where ti and tf = initial and
% final values of independent variable
% y0 = initial value of dependent variable
% h = step size
% output:
% t = vector of independent variable
% y = vector of solution for dependent variable
ti = tspan(1);
tf = tspan(2);
t = (ti:h:tf)';
n = length(t);
% if necessary, add an additional value of t
% so that range goes from t = ti to tf
if t(n)<tf
 t(n+1) = tf;
 n = n+1;
end
y = y0*ones(n,1); %preallocate y to improve efficiency
for i = 1:n-1
 hh = t(i+1) - t(i);
 k1 = feval(dydt,t(i),y(i));
 ymid = y(i) + k1*hh/2;
 k2 = feval(dydt,t(i)+hh/2,ymid);
 y(i+1) = y(i) + k2*hh;
end
plot(t,y)