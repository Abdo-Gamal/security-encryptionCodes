function [Cipher_txt] = Vigen_Encrypt(Plain_txt,Key)
chars='a':'z';
Plain_txt=Plain_txt(Plain_txt~=' ');
Plain_txt=lower(Plain_txt);

Key=Key(Key~=' ');
Key=lower(Key);
Cipher_txt = '';
c=length(Key);
for i=1:length(Plain_txt)
    pand_idx=find(chars==Plain_txt(i));
    key_idx=find(chars==Key(  mod(i-1,c)+1 ) )-1;
    new_idx=mod(key_idx+pand_idx-1,26)+1;
    Cipher_txt(i)=chars(new_idx);
end
Cipher_txt=upper(Cipher_txt);
end