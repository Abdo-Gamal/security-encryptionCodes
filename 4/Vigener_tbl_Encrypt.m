function Cipher_txt = Vigener_tbl_Encrypt(Plain_txt,Key)
Chars = 'a' : 'z';
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt~=' ');
Key = lower(Key);
Key = Key(Key ~= ' ');
Cipher_txt = '';
Char_Mat = char(zeros(26,26));

for I = 1 : 26
    Char_Mat(I,:) = [Chars(I:26) Chars(1:I-1)];
end
C = length(Key);
for I = 1 : length(Plain_txt)   
    Plain_Ind = find(Chars == Plain_txt(I));
    Key_Ind = find( Chars == Key( mod( I-1 , C ) + 1 ) );    
    Cipher_txt(I) = Char_Mat(Key_Ind , Plain_Ind); 
end
Cipher_txt = upper(Cipher_txt);
end
%     C = C + 1;
% if C > length(Key)
%         C = 1;
%     end
%     Char_Mat(I,:) = circshift(Chars,-K,2);
%     K=K+1;