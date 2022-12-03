function Plain_txt = OTPad_Decrypt(Cipher_txt,Key)
Chars = 'a':'z';  
Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt(Cipher_txt ~= ' ');
Key = lower(Key);
Key = Key(Key ~= ' ');
Plain_txt = '';
if (length(Key) == length(Cipher_txt))
    for I = 1 : length(Cipher_txt)
        Cipher_Ind = find(Chars == Cipher_txt(I));            
        Key_Ind = find(Chars == Key(I)) - 1;                       
        Plain_Ind = Cipher_Ind - Key_Ind;
        Plain_Ind = mod(Plain_Ind - 1 , 26) + 1;
        Plain_txt(I) = Chars(Plain_Ind );            
    end    
else
    disp('Cipher_txt and Key must be of the same length')
end
end