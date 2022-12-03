function [Plain_txt] = Vigen_Decrypt(Cipher_txt,Key)
Chars = 'a':'z';
Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt(Cipher_txt ~= ' ');
Plain_txt = '';
% C = 1;
C = length(Key);
for I = 1 : length(Cipher_txt)
    Cipher_Ind = find(Chars == Cipher_txt(I));
    Key_Ind = find(Chars == Key( mod(I - 1,C) + 1 )) - 1;
    Plain_Ind = Cipher_Ind - Key_Ind;
    Plain_Ind = mod(Plain_Ind - 1 , 26) + 1;
    Plain_txt(I) = Chars(Plain_Ind);       
end
end