function Cipher_txt = Vigener_tbl_Encrypt(Plain_txt,Key)
Chars = 'a' : 'z';
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt~=' ');
Key = lower(Key);
Key = Key(Key ~= ' ');
Cipher_txt = '';
Char_Mat = char(zeros(26,26));
for I = 1 : 26
    Char_Mat(I,:) = [Chars(I:end) Chars(1:I-1)];
end
C = 1;
for I = 1 : length(Plain_txt)   
    Plain_Ind = find(Chars == Plain_txt(I));
    if C > length(Key)
        C = 1;
    end
    Key_Ind = find( Chars == Key(C) );
    Cipher_txt(I) = Char_Mat(Key_Ind , Plain_Ind); 
    C = C + 1;
end
Cipher_txt = upper(Cipher_txt);
end
%     Char_Mat(I,:) = circshift(Chars,-K,2);
%     K=K+1;