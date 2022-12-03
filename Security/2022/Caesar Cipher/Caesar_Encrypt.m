function Cipher_txt = Caesar_Encrypt(Plain_txt,Key)
Chars = 'a':'z';
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt ~= ' ');
Cipher_txt = '';
for I = 1:length(Plain_txt)
    Plain_Ind = find(Chars == Plain_txt(I));
    Cipher_Ind = Plain_Ind + Key;
    Cipher_Ind = mod(Cipher_Ind - 1 , 26) + 1;
    Cipher_txt(I) = Chars(Cipher_Ind);       
end
Cipher_txt = upper(Cipher_txt);
end