function [Cipher_txt] = Vigen_Encrypt(Plain_txt,Key)
Chars = 'a':'z';
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt ~= ' ');
Cipher_txt = '';
% C = 1;
C = length(Key);
for I = 1 : length(Plain_txt)
    Plain_Ind = find(Chars == Plain_txt(I)) - 1;
    Key_Ind = find(Chars == Key( mod(I - 1,C) + 1 )) - 1;
    Cipher_Ind = Plain_Ind + Key_Ind;
    Cipher_Ind = mod(Cipher_Ind - 1 , 26) + 1;
    Cipher_txt(I) = Chars(Cipher_Ind + 1);       
end
Cipher_txt = upper(Cipher_txt);
end