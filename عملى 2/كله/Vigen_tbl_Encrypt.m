function [cipher_text]=Vigen_tbl_Encrypt(plan_text,key)
chars='a':'z';
plan_text=plan_text(plan_text~=' ');
plan_text=lower(plan_text);
key=key(key~=' ');
key=lower(key);

char_mat=char(zeros(26,26));

for i=1:26
char_mat(i,:)=[chars(i:26) chars(1:i-1) ];
end

c=length(key);
cipher_text='';
for i=1:length(plan_text)
        ch_idx=find(chars==plan_text( i ));
        key_idx=find(chars==key(  mod(i-1,c)+1 ));
        cipher_text(i)=char_mat(key_idx,ch_idx);
end


end