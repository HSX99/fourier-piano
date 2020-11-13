n = 100;
x = 1:n;

k = 6;
o = 0.333;

nw = floor((n-(k*o))/(k*(1-o)));

disp('***')
for i = 1:nw
    a = floor((i-1)*k*(1-o)+1);
    b = a + k - 1;
    w = x(a:b)
end