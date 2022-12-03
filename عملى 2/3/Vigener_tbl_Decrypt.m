function Plain_txt = Vigener_tbl_Decrypt(Cipher_txt,key)
chars='a':'z';
Cipher_txt=lower(Cipher_txt);
Cipher_txt=Cipher_txt(Cipher_txt~=' ');

key=lower(key);
key=key(key~=' ');
mat=char(ones(26,26));

for i=1:26
  mat(i,:)=[chars(i:26) chars(1:i-1) ];
end
Plain_txt='';
c=length(key);
for i=1:length(Cipher_txt)
    key_idx=find(chars== key( mod( i-1 , c ) + 1 ));
     cipher_idx=find(mat(key_idx,:)==Cipher_txt(i));
    Plain_txt(i)=chars(cipher_idx);
end
end