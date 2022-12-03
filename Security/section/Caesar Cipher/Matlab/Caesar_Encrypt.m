function Cipher_txt = Caesar_Encrypt(Plain_txt,Key)
Chars = 'a' : 'z';
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt( Plain_txt ~= ' ' );
Cipher_txt = Plain_txt;

for I = 1 : length(Plain_txt)    
    Plain_Ind = find( Chars == Plain_txt(I) );
    Ciphr_Ind = Plain_Ind + Key;
    if Ciphr_Ind > 26
        Cipher_Ind = mod(Cipher_Ind,26);
    end
    Cipher_txt(I) = Chars(Cipher_Ind);
end

Cipher_txt = upper(Cipher_txt);

end