%                     2. Introduction to MATLAB
%% Initializing MATLAB
close all hidden % Close all figures
clear % Remove items from workspace
clc % Clear command window
%% Variable Naming Rules
A = 1;  a = 2, A1 = 5
B = 3;  b = 4, B1 = 6

A_1 = 10;
B_1 = 12;

C = [];
isempty(C)
% Format
format('long')
D = 2.5
format('short')
E = 2.5
%% Built-in Variables
clearvars, clc % Clear previus section outputs

A = 5; B = 6;
A+B; % ans
C = pi; % pie = 3.141592653589793...
D = eps; % epsilon
E = 2e-3; % 2 * 10^(-3)
F = 5+6i; G = 5+6j; % Complex Numbers
H = 1/0; % Infinite (inf)
isinf(H)
I = 0/0; % Not a Number (NaN)
isnan(I)
%% Data Types and Data Precision
clearvars, clc % Clear previus section outputs
% Logical variables
A = 0;  a = false;   aa = logical(A);
B = 1;  b = true;  bb = logical(B);

isequal(a,aa)
isequal(a,b)

C = logical(0); c = logical(-5);
D = logical(1); d = logical(5);
% Numerical Data
E = [0,1,5,-5,127,255,32767,65535,2147483647,4294967295,9223372036854775807,18446744073709551615];
E1 = logical(E);
E2 = single(E); % realmin('single'),% realmax('single')
E3 = double(E); % realmin('double'),% realmax('double')
E4 = int8(E); E5 = uint8(E);
E6 = int16(E); E7 = uint16(E);
E8 = int32(E); E9 = uint32(E);
E10 = int64(E); E11 = uint64(E);
% Text Data (character and string)
F = 'A';
F1 = 'ABCD';
F3 = char(65);
F4 = char([65,66,67,68]);
F5 = "ABCD";
F6 = ["AB","CD"];
%% Some Simple Functions
ischar(F1),pause()
ischar(F5),pause()
isa(F5,'char'),pause()
isa(F5,'string'),pause()

whos
exist E
class(E)
range(E)
range([-5,-4,-3,-2,-1,0,1,2,3,4,5]),pause()
%% Converting Between Data Types
clearvars, clc % Clear previus section outputs

n = 50.25;
N = num2str(n);
nn = str2double(N);
N1 = int2str(n);
%% Mathematical Operators and Functions
clearvars, clc % Clear previus section outputs
% Mathematical operators (scalar)
A = 15;
B = 10;

C1 = A+B;
C2 = A-B;
C3 = A*B;
C4 = A/B;
C5 = A\B;
C6 = A^B;
C7 = -A;
% Mathematical functions
D1 = round(C4); % round
D2 = floor(C4); % round to -inf
D3 = ceil(C4); % round to +inf
D4 = fix(C4); % round to zero

E1 = log(B); % Natural logarithm
E2 = log10(B); % Base 10 Logarithm

F1 = lcm(A,B); % Least Common Multiple
F2 = gcd(A,B); % Greatest Common Divisor

G1 = abs(C7); % Absolute value
G11 = abs(5+2i); % Magnitude of a complex number
G12 = angle(5+2i); % Angle of a complex number [-pi pi]
G2 = sqrt(4); % Square root
G3 = exp(B); % Exponential
G4 = factorial(5); % Factorial
G5 = mod(A,B); % A - B*floor(A/B)
G6 = rem(A,B); % A - B*fix(A/B)
G7 = mod(-A,B);
G8 = rem(-A,B);
% logical operators
a = false;
b = true;

na = ~a; nb = ~b; % not
c(1) = a&a; c(2) = a&b; c(3) = b&a; c(4) = b&b; % and
d(1) = a|a; d(2) = a|b; d(3) = b|a; d(4) = b|b; % or
e(1) = xor(a,a); e(2) = xor(a,b); e(3) = xor(b,a); e(4) = xor(b,b); % X-or

H1 = A<B;
H2 = A>B;
H3 = A<=B;
H4 = A>=B;
H5 = A==B;
H6 = A~=B;
%% operator precedence
% 1. () parenthesis
% 2. ' Transpose and, ^ , .^ power
% 3. Unary Plus (+), Minus (-), not (~)
% 4. * , .* , / , ./ , \ , .\
% 5. + , -
% 6. :
% 7. < , <= , > , >= , == , ~=
% 8. &
% 9. |
% 10. &&
% 11. ||

clearvars, clc % Clear previus section outputs

A = 2; B = 5; C = 4;

D = A+B*C;    D0 = (A+B)*C;
D1 = A*B+C;   D2 = (A*B)+C;
D3 = C/A+B;   D4 = (C/A)+B;
D5 = 2*1:10;  D6 = 1:10*2;  D7 = (1:10)*5; D8 = 5*(1:10);
%% Trigonometric Functions
clearvars, clc % Clear previus section outputs
Ad = [0 90 180 270 360];
Ar = deg2rad(Ad);
Ap = [0 1/2 1 3/2 2];

Bd = sind(Ad);
Br = sin(Ar);
Bpi = sinpi(Ap); Brpi = sin(Ap*pi);

% Other trigonometric functions:

% sin, cos, tan, cot, sec, csc
% sinpi, cospi
% sind, cosd, tand, cotd, secd, cscd
% asin, acos, atan, acot, asec, acsc
% asind, acosd, atand, acotd, asecd, acscd

% Hyperbolic Functions:

% sinh, cosh, tanh, coth, sech, csch
% asinh, acosh, atanh, acoth, asech, acsch

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%END%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%