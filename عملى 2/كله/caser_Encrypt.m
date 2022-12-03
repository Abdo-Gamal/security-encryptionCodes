function [cipher_text]=caser_Encrypt(plan_text,key)

chars='a':'z';
plan_text=plan_text(plan_text~=' ');
plan_text=lower(plan_text);

cipher_text='';
for i=1:length(plan_text)
    indx_ch=find(chars==plan_text(i));
    cipher_text(i)=chars(mod(indx_ch+key-1,26)+1);
end

end