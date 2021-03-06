a = [2 -1 0 ; 1 6 -2 ; 4 3 8];
d = [2 0 0 ; 0 6 0 ; 0 0 8]; % diagonal matrix
w = [0 0 0 ; 1 0 0 ; 4 -3 8]; % lower triangular matrix

b = [2 ; -4 ; 5];
z = a^(-1)*b;

x = [0; 0; 0];
y = [0; 0; 0];
I = [1 0 0 ; 0 1 0 ; 0 0 1];

for i = 1:10
    x = (I - d^(-1)*a)*x + d^(-1)*(b); % jacobi
    y = (I - (d+w)^(-1)*a)*y + (d+w)^(-1)*(b); % gauss-seidel
    i
    [x, y, z]
end
    