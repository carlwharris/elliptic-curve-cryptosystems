% Print the decryption process and decrypted message
function PrintDecryptionProcess(alicePrivateKey, Decryption, Encryption)
fprintf(['\n(STEP 5) Decrypting message using Alice''s private key, k_a = ', ...
         '%0.0f...\n'], alicePrivateKey);                        
for i = 1:size(Decryption.Message,2)
    fprintf(['\t%2.0f. k_a(l * Q) \t\t\t\t\t\t= %3.0f(%3.0f, %3.0f) ', ...
             '\t\t\t= (%3.0f, %3.0f)'], i, alicePrivateKey, ...
             Encryption.Keys(1,i), Encryption.Keys(2,i), ...
             Decryption.FirstPoint(1,i), Decryption.FirstPoint(2,i));
    fprintf(['\n\t\t(M + l(k_a * Q)) - k(l * Q) \t= (%3.0f, %3.0f) - ', ...
             '(%3.0f, %3.0f) \t= (%3.0f, %3.0f) -> ''%s''\n'], ...
             Encryption.Message(1,i), Encryption.Message(2,i), ...
             Decryption.FirstPoint(1,i), Decryption.FirstPoint(2,i), ...
             Decryption.UnicodeMessage(1,i), Decryption.UnicodeMessage(2,i),...
             Decryption.Message(i))
end
fprintf('\n\tFully decrypted message: %s\n', Decryption.Message)
end