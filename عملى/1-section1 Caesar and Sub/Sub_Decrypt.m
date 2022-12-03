function [Plain_txt] = Sub_Decrypt(Cipher_txt,Key)
Chars = 'a':'z';
Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt( Cipher_txt ~= ' ' );
Plain_txt = '';

for I = 1:length(Cipher_txt)
    Plain_Ind = find( Key == Cipher_txt(I) );
    Plain_txt(I) = Chars(Plain_Ind);
end
end