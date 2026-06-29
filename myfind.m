function [Ind] = myfind(X)

X = X(:);
c = 0;
for i = 1 : length(X)
    
    if X(i)~=0
        c = c+1;
        Ind(c) = i;
    end
    
end

end