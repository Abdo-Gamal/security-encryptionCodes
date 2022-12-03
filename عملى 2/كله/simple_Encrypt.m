function [cipher_text,key]=simple_Encrypt(plan_text)

chars='a':'z';
plan_text=plan_text(plan_text~=' ');
plan_text=lower(plan_text);

cipher_text='';
key=chars(randperm(26));
for i=1:length(plan_text)
    indx_ch=find(chars==plan_text(i));
    cipher_text(i)=key(indx_ch);
end

end