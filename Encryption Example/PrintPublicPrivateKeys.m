% Print Alice and Bob's public and private keys
function PrintPublicPrivateKeys(alicePrivateKey, alicePublicKey, bobPrivateKey, bobPublicKey)
fprintf('\n(STEP 2) Creating Public and Private Keys...\n')
fprintf('\tAlice''s Secret Key (k_a): %3.0f\n', alicePrivateKey)
fprintf('\tAlice''s Public Key (k_a * Q): (%3.0f, %3.0f)\n', ...
        alicePublicKey(1), alicePublicKey(2))
fprintf('\tBob''s Secret Key (k_b): %3.0f\n', bobPrivateKey)
fprintf('\tBob''s Public Key (k_b * Q): (%3.0f, %3.0f)\n', bobPublicKey(1), ...
        bobPublicKey(2))
end