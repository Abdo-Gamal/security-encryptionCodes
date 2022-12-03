function Cipher_txt = Vigener_tbl_encrption( Plain_txt,key)
chars='a':'z';
Plain_txt=lower(Plain_txt);
Plain_txt=Plain_txt(Plain_txt~=' ');

key=lower(key);
key=key(key~=' ');
mat=char(ones(26,26));

for i=1:26
  mat(i,:)=[chars(i:26) chars(1:i-1) ];
end
Cipher_txt='';
c=length(key);
for i=1:length(Plain_txt)
    plan_idx=find(chars==Plain_txt(i));
    key_idx=find(chars== key( mod( i-1 , c ) + 1 ));
    Cipher_txt(i)=mat(key_idx,plan_idx);
end
Cipher_txt = upper(Cipher_txt);
end