function [Plain_txt] = Vigen_decption( Cipher_txt,Key)
chars='a':'z';
Cipher_txt=Cipher_txt(Cipher_txt~=' ');
Cipher_txt=lower(Cipher_txt);

Key=Key(Key~=' ');
Key=lower(Key);

Plain_txt = '';
c=length(Key);
for i=1:length(Cipher_txt)
    cipher_idx=find(chars==Cipher_txt(i));
    key_idx=find(chars==Key(  mod(i-1,c)+1 ) )-1;
    new_idx=mod(cipher_idx-key_idx-1,26)+1;
    Plain_txt(i)=chars(new_idx);
end
Plain_txt=upper(Plain_txt);
end