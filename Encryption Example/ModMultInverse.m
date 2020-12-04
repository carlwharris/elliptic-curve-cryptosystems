% Return the modular multiplicative inverse of 'x' mod 'p.' If the point at 
% infinity has been reached, return an inverse value of nan.
function inverse = ModMultInverse(x,p)

% Convert x and p to higher-precision storage
x = sym(x);
p = sym(p);

% Find the modular multiplicative inverse gcd and mod.
[G, C, ~] = gcd(x,p);
if G == 1
    inverse = mod(C,p);

    % Convert the modular multipicative inverse back into double precision
    inverse = double(inverse);
else
    inverse = nan;
end
end