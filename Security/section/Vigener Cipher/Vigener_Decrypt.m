function Plain_txt = Vigener_Decrypt(Cipher_txt,Key)
Chars = 'a':'z';
Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt(Cipher_txt~=' ');
Key = lower(Key);
Key = Key(Key ~= ' ');
Plain_txt = '';
C = 1;
for I = 1 : length(Cipher_txt)
    Cipher_Ind = find( Chars == Cipher_txt(I));
    if C > length(Key)
        C = 1;
    end
    Key_Ind = find( Chars == Key(C) ) - 1;
    Plain_Ind =  Cipher_Ind - Key_Ind;
    Plain_Ind = mod(Plain_Ind - 1 , 26) + 1;
    Plain_txt(I) = Chars(Plain_Ind); 
    C = C + 1;
end    
end