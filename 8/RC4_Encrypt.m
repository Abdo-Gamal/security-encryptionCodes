function [Cipher_txt,Cipher_Hex] = RC4_Encrypt(Plain_txt,Key)
%% 1) Initialize Vector S of 256 bytes
S = 0 : 255 ;

%% 2) Create a temporary vector T with the same size as S and contains a repeated input key
Key_Len = length(Key); 
T =  zeros(1,256);
for I = 0 : 255 
    T( I + 1 ) = Key( mod( I  , Key_Len ) + 1 );
end
%% 3) Use the vector T to produce initial permutation for S starting with S(0) and going through S(255)
J = 0;
for I = 0 : 255  
    J = mod( J + S(I + 1) + T(I + 1)  , 256 ) ;
    Temp = S(I + 1);
    S(I + 1) = S(J + 1);
    S(J + 1) = Temp;
end
%% 4) Stream Generation: Once the vector S is initialized,we generate the key that will be used to encrypt the plain text
I = 0; J = 0;
Plain_Len = length(Plain_txt);
for L = 1 : Plain_Len
    I = mod( I + 1  , 256 );
    J = mod( J + S(I + 1) , 256 );
    Temp = S(I + 1);
    S(I+1) = S(J + 1);
    S(J+1) = Temp;
    t = mod( S(I + 1) + S(J + 1) , 256 );    
    K = S(t + 1);  
    %% 5) XOR each byte in the key with the corresponding byte of plain text to generate the cipher text
    Pl_Dec = double( Plain_txt( L ) ); 
    Cipher_Dec(L) = bitxor( Pl_Dec , K );
end
Cipher_Hex = mat2str(dec2hex(Cipher_Dec,2));
Cipher_txt = char(Cipher_Dec);
end