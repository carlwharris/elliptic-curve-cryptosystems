% Add point 'p' to point 'q' on curve 'curve.' Return the resultant
% point, 'r,' and whether 'p' + 'q' has reached the point at infinity by the
% boolean 'reachedInfinity.' If the point at infinity has been reached, 'r' 
% will have a nan value and 'reachedInfinity' will be true.
function r = AddPoints(p, q, EllipticCurve)
x1 = p(1);
y1 = p(2);
x2 = q(1);
y2 = q(2);

% If the points are the same, lambda = (3*x1^2 + a) / (2 * y1).
if isequal(p,q)
    inv = ModMultInverse(2 * y1, EllipticCurve.p);
    if ~isnan(inv)
        lambda = (3*x1^2 + EllipticCurve.a) * inv;
    end
% If the points are different, lambda = (y2 - y1) / (x2 - x1).
else
    inv = ModMultInverse(x2-x1, EllipticCurve.p);
    if ~isnan(inv)
        lambda = mod(y2 - y1, EllipticCurve.p) *  inv;
    end        
end

r = nan;

% If the point at infinity has not been reached, assign the correct values to
% 'r.'
if ~isnan(inv)
    lambda = double(lambda);
    x3 = lambda^2 - x1 - x2;
    y3 = lambda*(x1-x3) - y1;
    x3 = mod(x3, EllipticCurve.p);
    y3 = mod(y3, EllipticCurve.p);
    r = [x3 y3];
end
end
