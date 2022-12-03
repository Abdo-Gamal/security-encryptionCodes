function Plain_txt = Vigener_tbl_Decrypt(Cipher_txt,Key)
Chars = 'a' : 'z';
Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt(Cipher_txt ~= ' ');
Key = lower(Key);
Key = Key(Key ~= ' ');
Plain_txt = '';
Char_Mat = char(zeros(26,26));
for I = 1 : 26
    Char_Mat(I,:) = [Chars(I:end) Chars(1:I-1)];
end
C = 1;
for I = 1 : length(Cipher_txt)
    if C > length(Key)
        C = 1;
    end
    Key_Ind = find( Chars == Key(C) );
    [Row,Col] = find( Char_Mat(Key_Ind , :) == Cipher_txt(I));
    Plain_txt(I) = Chars(Col);
    C = C + 1;
end
end
