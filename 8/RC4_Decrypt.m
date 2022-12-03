function [Plain_txt]=RC4_Decrypt(Cipher_txt,Key)

%% 1) Initialize Vector S of 256 bytes
S=0:255;

%% 2) Create a temporary vector T with the same size as S and contains a repeated input key
Key_Len=length(Key); 
for I=0:255 
    T(I+1)=Key(mod(I,Key_Len)+1); 
end
T=double(T);%replace Characters with its ASCII code (Decimal value)
%% 3) Use the vector T to produce initial permutation for S starting with S(0) and going through S(255)
J=0;
for I=0:255  
    J=mod(J+S(I+1)+T(I+1),256);
    Temp=S(I+1);
    S(I+1)=S(J+1);
    S(J+1)=Temp;
end
%% 4) Stream Generation: Once the vector S is initialized,we generate the key that will be used to encrypt the plain text
I=0; J=0;
Cipher_Len=length(Cipher_txt);
for L=1:Cipher_Len
    I=mod(I+1,256);
    J=mod(J + S(I+1),256);
    Temp=S(I+1);
    S(I+1)=S(J+1);
    S(J+1)=Temp;
    t=mod(S(I+1)+S(J+1),256);    
    K=S(t+1);    
    Key_str(L)=K;
end
%% 5) XOR each byte in the key with the corresponding byte of cipher text to generate the plain text
for L=1:Cipher_Len
    Cipher_Dec=double(Cipher_txt(L));            
    Cipher_Bin=dec2bin(Cipher_Dec,8);
    Key_Dec=Key_str(L);
    Key_Bin=dec2bin(Key_Dec,8);
    Plain_Bin= bitxor(double(Cipher_Bin),double(Key_Bin));  
    Plain_Dec(L)=bin2dec(num2str(Plain_Bin));
end
Plain_txt=char(Plain_Dec);
end
%%To run: [Cipher_txt,Cipher_Hex]=RC4_Encrypt('hello world','secret')