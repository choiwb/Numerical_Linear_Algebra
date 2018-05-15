function [t,y] = Heun(dydt,tspan,y0,h,es,maxit)
% [t,y] = Heun(dydt,tspan,y0,h):
% uses the midpoint method to integrate an ODE
% input:
% dydt = name of the M-file that evaluates the ODE
% tspan = [ti, tf] where ti and tf = initial and
% final values of independent variable
% y0 = initial value of dependent variable
% h = step size
% es = stopping criterion (%)
% optional (default = 0.001)
% maxit = maximum iterations of corrector
% optional (default = 50)
% es = (optional) stopping criterion (%)
% maxit = (optional) maximum allowable iterations
% output:
% t = vector of independent variable
% y = vector of solution for dependent variable
% if necessary, assign default values
if nargin<6, maxit = 50; end %if maxit blank set to 50
if nargin<5, es = 0.001; end %if es blank set to 0.001
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
iter = 0;
for i = 1:n-1
 hh = t(i+1) - t(i);
 k1 = feval(dydt,t(i),y(i));
 y(i+1) = y(i) + k1*hh;
 while (1)
 yold = y(i+1);
 k2 = feval(dydt,t(i)+hh,y(i+1));
 y(i+1) = y(i) + (k1+k2)/2*hh;
 iter = iter + 1;
 if y(i+1) ~= 0, ea = abs((y(i+1) - yold)/y(i+1)) * 100; end
 if ea <= es | iter >= maxit, break, end
 end
end
plot(t,y) 