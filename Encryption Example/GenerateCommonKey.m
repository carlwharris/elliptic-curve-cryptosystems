% Generate the common key (k_a * k_b * Q) by multiplying the other person's 
% public key (k_b * Q, in Alice's case) with the private key (k_a, in Alice's 
% case). This common key, k_a * k_b * Q, will be the same for both parties 
% exchanging keys.
function CommonKey = GenerateCommonKey(publicKey, privateKey, Subgroup, ...
                                       EllipticCurve)
                                   
CommonKey = MultiplyPoints(Subgroup.BasePoint, publicKey, privateKey, ...
                           EllipticCurve);
end
