### Stephen Kridel ###
### MAE533 - Project 2###

### Problem 2 ###

E = 29E6;
P = 1000;
I = 510/144;
L = 10;

K = (E*I)/L * [12/L^2, 6/L, -12/L^2, 6/L;
                  6/L, 4, -6/L, 2;
                  12/L, -6/L, 12/L^2, -6/L;
                  6/L, 2, -6/L, 4];

R = [L/2; L^2/12; L/2; -L^2/12] * P - [1;0;0;0] * P*L - [0;1;0;0] * (P*L^2)/2;

K = [1.2325e+06, -6.1625e+06;
     -6.1625e+06, 4.1083e+07];

R = [5.0000e+03;
     -8.3333e+03];

# Ku = R
u = K\R

# Deflection and rotation from mechanics
del = (P*L^4) / (8*E*I)
phi = (P*L^3) / (6*E*I)


### Problem 3 ###

E = 30E6;
v = 0.3;
t = 0.1

#Symbolic toolbox
syms h1 h2 h3 h4
syms h1_x h2_x h3_x h4_x h1_y h2_y h3_y h4_y
syms x y
syms B H K R

h1 = 1/4*(1+x/2)*(1+2/3*y);
h2 = 1/4*(1-x/2)*(1+2/3*y);
h3 = 1/4*(1-x/2)*(1-2/3*y);
h4 = 1/4*(1+x/2)*(1-2/3*y);
h1_x = 1/8*(1+2/3*y);
h2_x = 1/8*(-1-2/3*y);
h3_x = 1/8*(-1+2/3*y);
h4_x = 1/8*(1-2/3*y);
h1_y = 1/6*(1+x/2);
h2_y = 1/6*(-1-x/2);
h3_y = 1/6*(-1+x/2);
h4_y = 1/6*(1-x/2);

H = [h1 0 h2 0 h3 0 h4 0;
     0 h1 0 h2 0 h3 0 h4
];

B = [h1_x, 0 h2_x 0 h3_x 0 h4_x 0;
     0 h1_y 0 h2_y 0 h3_y 0 h4_y;
     h1_y h1_x h2_y h2_x h3_y h3_x h4_y h4_x
];

D = (E/1-v^2)*[1 v 0; v 1 0; 0 0 (1-v)/2];

k_y = transpose(B)*D*B*t;
K_y = int(k_y, y, -3/2, 3/2);
K = int(K_y, x, -2, 2);

#sym -> double float precision
K = double(K)

h1f = 1/2*(1+x/2);
h2f = 1/2*(1-x/2);

Hf = [h1f h2f 0 0;
      0 0 h1f h2f];

f = transpose(Hf)*[0; -3/4*x-2];

R = int(f, x, -2, 2)


### Problem 4 ###

F = 362.5;
E = 14503774;
h = 3.94;
b = 1.969;
I = (b*h^3)/12;
L = 39.4;

del = (F*L^3)/(3*E*I)
sig = (F*L*h/2)/I
timo = (3*E*I)/(5/6*L^2*b*h*E/2)
