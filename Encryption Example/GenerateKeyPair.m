% Generate a private key by multiplying the base point by a random scalar 
% between 1 and the order of the group
function [privateKey, publicKey] = GenerateKeyPair(Subgroup, EllipticCurve)
privateKey = randi(Subgroup.Order);
publicKey = MultiplyPoints(Subgroup.BasePoint, Subgroup.BasePoint, ...
                           privateKey, EllipticCurve);
end
