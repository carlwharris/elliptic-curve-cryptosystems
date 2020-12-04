% Encrypt the plain text message 'message' using public key 'publicKey,'
% generated in subgroup 'Subgroup' on curve 'EllipticCurve.' Encrypt each letter
% individually, and return a pair of points corresponding to the encrypted value
% of each characcter. Encryption.Keys contains the points corresponding to 
% lQ, where l is a random number less than the subgroup order. 
% Encryption.Message contains the points corresponding to M + l(kQ), where M
% is the point (unicode, 0), where 'unicode' is the unicode value of the letter,
% l is the random integer, and kQ is the publi key.
function Encryption = EncryptMessage(message, Subgroup, publicKey, ...
                                     EllipticCurve)

unicodeValues = double(message);

Encryption = struct;
Encryption.Keys = zeros(2, length(unicodeValues));
Encryption.Message = zeros(2, length(unicodeValues));
for i = 1:length(unicodeValues)
    randVal = randi(Subgroup.Order);
    
    currKey = MultiplyPoints(Subgroup.BasePoint, Subgroup.BasePoint, ...
                             randVal, EllipticCurve);
    Encryption.Keys(1:2,i) = currKey;
    
    randValEncryptionPair = MultiplyPoints(Subgroup.BasePoint, publicKey, ...
                                           randVal, EllipticCurve);
    currentCharacter = [unicodeValues(i) 0];
    encryptedCharacter = currentCharacter + randValEncryptionPair;
    Encryption.Message(1:2,i) = encryptedCharacter;
end
end