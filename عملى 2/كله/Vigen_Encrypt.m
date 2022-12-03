function [cipher_text]=Vigen_Encrypt(plan_text,key)

chars='a':'z';
plan_text=plan_text(plan_text~=' ');
plan_text=lower(plan_text);
key=key(key~=' ');
key=lower(key);

cipher_text='';
c=length(key);
for i=1:length(plan_text)
    ch_idx=find(chars==plan_text(i));
    key_idx=find(  chars==key( mod(i-1,c)+1  ))-1;
    new_idx=mod(key_idx+ch_idx-1,26)+1;
    cipher_text(i)=chars(new_idx);
end
end