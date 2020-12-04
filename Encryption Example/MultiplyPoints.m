% Add the base point 'publicPoint' to a point in the subgroup, 'q', 'n' times
% on curve 'curve'. If the point at infinity has been reached, wrap around
% to the base point.
function p = MultiplyPoints(basePoint, p, n, EllipticCurve)
i = 1;
while i < n
    p = AddPoints(p, basePoint, EllipticCurve);
    i = i+1;
    if isnan(p)
        i = i+1;
        p = basePoint;
    end
end
end
