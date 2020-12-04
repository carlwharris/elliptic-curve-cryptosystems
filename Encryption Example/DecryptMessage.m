% Decrypt the message contained in 'Encryption.' For each letter, generate
% k(lQ) by multiplying the corresponding column in Encryption.Keys (which is
% lQ) by the private key. Subtract this from the corresponding column in 
% Enryption.Message to find M + l(kQ) - k(lQ) = M. Convert the x coordinate
% of M from unicode to plain text to find the unencrypted letter. 
% After this process has been completed for each letter, save the final 
% plaintext message in 'Decryption.Message.'
function Decryption = DecryptMessage(Encryption, Subgroup, privateKey, ...
                                     EllipticCurve)
Decryption = struct;
Decryption.FirstPoint = zeros(2, size(Encryption.Keys,2));
Decryption.UnicodeMessage = [];
for i = 1:size(Encryption.Keys,2)
    currentKey = Encryption.Keys(1:2,i);
    currentEncryptedMsg = Encryption.Message(1:2,i);
    
    secretRand = MultiplyPoints(Subgroup.BasePoint, currentKey, privateKey, ...
                                EllipticCurve);
    Decryption.FirstPoint(1:2,i) = secretRand;
    
    msg = currentEncryptedMsg - secretRand';
    Decryption.UnicodeMessage = [Decryption.UnicodeMessage msg];
end
Decryption.Message = char(Decryption.UnicodeMessage(1,:));
end