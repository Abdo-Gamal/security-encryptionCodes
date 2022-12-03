function [Cipher_txt,Key] = Sub_Encrypt(Plain_txt)
Chars = 'a':'z';
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt( Plain_txt ~= ' ' );
Cipher_txt = '';


for I = 1:length(Plain_txt)
Key = Chars(randperm(26));
    Cipher_Ind = find( Chars == Plain_txt(I) );
    Cipher_txt(I) = Key(Cipher_Ind);
end
Cipher_txt = upper(Cipher_txt);
end