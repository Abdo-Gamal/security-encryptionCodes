function [ plan_text]=Vigen_decraption(cipher_text,key)

chars='a':'z';
cipher_text=cipher_text(cipher_text~=' ');
cipher_text=lower(cipher_text);
key=key(key~=' ');
key=lower(key);

plan_text='';
c=length(key);
for i=1:length(cipher_text)
    ch_idx=find(chars==cipher_text(i));
    key_idx=find(  chars==key( mod(i-1,c)+1  ))-1;
    new_idx=mod(ch_idx-key_idx-1,26)+1;
    plan_text(i)=chars(new_idx);
end
end