% The following code provides a simple example implementation of elliptic
% curve cryptography (ECC) for message transmission with customizable curve 
% parameters and base points.

%% PART 1: CREATE AN ELLIPTIC CURVE AND A CYCLIC SUBGROUP
% Create an elliptic curve in the form y^2 = x^3 + ax + b mod p, where
% a is 'EllipticCurve.a', b is 'EllipticCurve.b', and p is the 'primeNo'th
% prime number. The default curve is y^2 = x^3 + x + 1 mod 436.
EllipticCurve = struct;
primeNo = 90;
EllipticCurve.a = 1;
EllipticCurve.b = 1;
EllipticCurve.p = nthprime(primeNo);

% Use the point [0, 1] as the base point to generate a subgroup of the
% curve.
Subgroup.BasePoint = [0 1];

% Do a naive search and return all the elements generated by the base
% point and the order of the subgroup generated by the base point (this
% implementation for finding the subgroup order is very inefficient, see
% Schoof's algorithm for a feasible implementation for more complex curves).
[order, elements] = FindSubgroupOrder(Subgroup, EllipticCurve);
Subgroup.Order = order;
PrintEllipticCurveSummary(primeNo, Subgroup, EllipticCurve)

%%
EllipticCurve = struct;
EllipticCurve.a = 1;
EllipticCurve.b = 1;
EllipticCurve.p = 7;
Subgroup.BasePoint = [0 1];
r = AddPoints([0 1], [2 2], EllipticCurve)

%% STEP 2: Generate the public and private keys for "Bob" and "Alice," who are 
% trying to send messages securely.
[alicePrivateKey, alicePublicKey] = GenerateKeyPair(Subgroup, EllipticCurve);
[bobPrivateKey, bobPublicKey] = GenerateKeyPair(Subgroup, EllipticCurve);
PrintPublicPrivateKeys(alicePrivateKey, alicePublicKey, bobPrivateKey, bobPublicKey)

%% STEP 3: GENERATE THE COMMON KEY USING PUBLIC AND PRIVATE KEYS
% Generate the common key, and notice that it is the same (on complex curves, 
% determining k_a * K_b * Q from k_a * Q and k_b * Q is infeasible, which is the 
% basis for ECC's security).
aliceCommonKey = GenerateCommonKey(bobPublicKey, alicePrivateKey, Subgroup, ...
                                   EllipticCurve);
bobCommonKey = GenerateCommonKey(alicePublicKey, bobPrivateKey, Subgroup, ...
                                 EllipticCurve);
PrintCommonKeys(aliceCommonKey, bobCommonKey)

%% STEP 4: Encrypt a message using Alica's public key.  
% Here, each letter in 'message' is converted to unicode and is encrypted using 
% two points on the elliptic curve. First, a random number, 'l', from 0 to the 
% order of the  subgroup is selected, and used as a scalar multiple of the base 
% point Q. This is the first point in the pair generated for each letter. The 
% second point  consists of 'l' multiplied by Alice's private key (k_a * Q), 
% added to the  message, 'M'. Technically, 'M' should be an element of the 
% subgroup, but for  the sake of simplicity I selected the point M = (unicode 
% of letter, 0). This isn't quite correct, but it still gets the idea across. 
% f('message') = M should be a mapping from the message text to the subgroup. 
% Here, I didn't  include such a mapping because this program is designed to 
% work with small  curves, where the subgroup order is less than the total 
% possible unicode values.
message = 'Hello world';
Encryption = EncryptMessage(message, Subgroup, alicePublicKey, EllipticCurve);
PrintEncryptionProcess(message, alicePublicKey, Encryption)

%% STEP 5: Decrypt the message using Alice's private key.
Decryption = DecryptMessage(Encryption, Subgroup, alicePrivateKey, ...
                            EllipticCurve);
PrintDecryptionProcess(alicePrivateKey, Decryption, Encryption)
