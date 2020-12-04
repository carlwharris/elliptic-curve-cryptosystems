% Find the order and all the elements generated by base point 'q' on curve
% 'curve'.
function [order, elements] = FindSubgroupOrder(Subgroup, EllipticCurve)

% Create the 'elements' array which will hold all the elements in the
% subgroup and set the initial 'currPoint' value to the base point
elements = zeros(0,2);
currPoint = Subgroup.BasePoint;

% While the point at infinity has not been reached, add 'currPoint' and the base
% point.
while ~isnan(currPoint)
    elements = [elements; currPoint];
    currPoint = AddPoints(currPoint, Subgroup.BasePoint, EllipticCurve);
end

% Return the order of the subgroup and all of its elements
order = size(elements,1);
end