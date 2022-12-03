function Cipher_txt = Vigener_Encrypt(Plain_txt,Key)
Chars = 'a':'z';
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt ~= ' ');
Key = lower(Key);
Key = Key(Key ~= ' ');
Cipher_txt = '';
C = 1;
for I = 1:length(Plain_txt)
    Plain_Ind = find( Chars == Plain_txt(I));
    if C > length(Key)
        C = 1;
    end
    Key_Ind = find(Chars == Key(C)) - 1;
    Cipher_Ind =  Plain_Ind + Key_Ind;
    Cipher_Ind = mod(Cipher_Ind - 1 , 26) + 1;
    Cipher_txt(I) = Chars(Cipher_Ind); 
    C = C + 1;
end
Cipher_txt = upper(Cipher_txt);
end