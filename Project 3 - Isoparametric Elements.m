### Stephen Kridel ###
### MAE 533 - Project 3 ###

clear;clc;
warning('off', 'all')

# Problem 1 #
fprintf('\n\nProblem 1:\n\n')
syms x L E

B1 = (-2*x)/L^2;
B2 = (2*x)/L^2;

B = [B1, B2];

ke = transpose(B)*E*B;

fprintf('a:\n')
ke = int(ke, x, 0, L)

clear

syms x L E

B1 = (4*x)/L - 1/L;
B2 = (4*x)/L + 1/L;

B = [B1, B2];

ke = transpose(B)*E*B;

fprintf('b:\n')
ke = int(ke, x, -L/2, L/2)

# Problem 2 #
clear
fprintf('\n\nProblem 2:\n\n')

syms s r x y

H1 = 1/4 * ((1+s)*(1+r));
H2 = 1/4 * ((1+s)*(1-r));
H3 = 1/4 * ((1-s)*(1-r));
H4 = 1/4 * ((1-s)*(1+r));

H = [H1, H2, H3, H4];

xc = [7, 6, 3, 9];
yc = [9, 4, 2, 2];

x = H*transpose(xc);
y = H*transpose(yc);

J = [diff(x, r, 1), diff(y, r, 1);
     diff(x, s, 1), diff(y, s, 1)]

J1 = subs(J, s, 1);
J1 = subs(J1, r, 1)

J2 = subs(J, s, 1);
J2 = subs(J2, r, -1)

J3 = subs(J, s, -1);
J3 = subs(J3, r, -1)

J4 = subs(J, s, -1);
J4 = subs(J4, r, 1)

det1 = det(J1)
det2 = det(J2)
det3 = det(J3)
det4 = det(J4)

# Problem 3 #
clear
fprintf('\n\nProblem 3:\n\n')

syms s r x y ve
syms u1 v1 u2 v2 u3 v3 u4 v4

H1 = 1/4 * ((1+s)*(1+r));
H2 = 1/4 * ((1+s)*(1-r));
H3 = 1/4 * ((1-s)*(1-r));
H4 = 1/4 * ((1-s)*(1+r));

H = [H1, H2, H3, H4];

dHdr = diff(H, r, 1);
dHds = diff(H, s, 1);

B = [dHds(1,1), 0, dHds(1,2), 0, dHds(1,3), 0, dHds(1,4), 0;
     0, dHdr(1,1), 0, dHdr(1,2), 0, dHdr(1,3), 0, dHdr(1,4);
     dHdr(1), dHds(1), dHdr(2), dHds(2), dHdr(3), dHds(3), dHdr(4), dHds(4)];

ue = [u1;v1;u2;v2;u3;v3;u4;v4];

strain = B*ue

exx = strain(1,:)
eyy = strain(2,:)
ezz = ve*(exx + eyy)

