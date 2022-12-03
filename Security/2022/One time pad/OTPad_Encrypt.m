function Cipher_txt = OTPad_Encrypt(Plain_txt,Key)
Chars = 'a':'z';  
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt ~= ' ');
Key = lower(Key);
Key = Key(Key ~= ' ');
Cipher_txt = '';
if (length(Key) == length(Plain_txt))
    for I=1:length(Plain_txt)
        Plain_Ind = find(Chars == Plain_txt(I));            
        Key_Ind = find(Chars == Key(I)) - 1; 
        Cipher_Ind =  Plain_Ind + Key_Ind;
        Cipher_Ind = mod(Cipher_Ind - 1 , 26) + 1;
        Cipher_txt(I) = Chars(Cipher_Ind);            
    end
    Cipher_txt = upper(Cipher_txt);
else
    disp('Plain_txt and Key must be of the same length')
end
end
%         New_Ind = (Ind-1)+(Key_Ind-1);
%         New_Ind=mod(New_Ind,26); 