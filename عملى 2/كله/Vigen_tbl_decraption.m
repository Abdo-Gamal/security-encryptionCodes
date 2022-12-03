function [ plan_text]=Vigen_tbl_decraption(cipher_text,key)
chars='a':'z';
cipher_text=cipher_text(cipher_text~=' ');
cipher_text=lower(cipher_text);
key=key(key~=' ');
key=lower(key);

char_mat=char(zeros(26,26));

for i=1:26
char_mat(i,:)=[chars(i:26) chars(1:i-1) ];
end

c=length(key);
plan_text='';
for i=1:length(cipher_text)
        key_idx=find(chars==key(  mod(i-1,c)+1 ));
        ch_idx=find(char_mat(key_idx,:)==cipher_text( i ));
        plan_text(i)=chars(ch_idx);
end


end