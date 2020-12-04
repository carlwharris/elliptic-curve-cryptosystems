% Scalar multiplication with boolean for whether the zero element has been
% reached.
function [p, isZero] = IsZeroMultiplication(basePoint, p, n, EllipticCurve)
i = 1;
isZero = false;
while i < n
    p = AddPoints(p, basePoint, EllipticCurve);
    i = i+1;
    if isnan(p)
        p = 0;
        isZero = true;
        break
    end
end
end