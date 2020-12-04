% Print the common keys that Alice and Bob generate using their own private key
% from each other's public key
function PrintCommonKeys(aliceCommonKey, bobCommonKey)
fprintf('\n(STEP 3) Generating Common Keys...');

fprintf('\n\tAlice''s Common Key (P = k_a * k_b * Q): (%3.0f, %3.0f)', ...
        aliceCommonKey(1), aliceCommonKey(2));
fprintf('\n\tBob''s Common Key (P = k_b * k_a * Q): (%3.0f, %3.0f)\n',...
        bobCommonKey(1), bobCommonKey(2));
end