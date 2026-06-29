function a = s(x,g)

narginchk(0,2)
nargoutchk(0,1)

if isempty(g)
    g = false;
end
a = [x,g];
end