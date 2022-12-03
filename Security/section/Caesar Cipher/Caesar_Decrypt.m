function Plain_txt = Caesar_Decrypt(Cipher_txt,Key)
Chars='a':'z';
Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt(Cipher_txt~=' ');
Plain_txt = '';
for I=1:length(Cipher_txt)
    Cipher_Ind = find( Chars == Cipher_txt(I) );
    Plain_Ind = Cipher_Ind - Key;
    Plain_Ind = mod(Plain_Ind - 1 , 26) + 1;
    Plain_txt(I) = Chars(Plain_Ind);
end
end