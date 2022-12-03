function [cipher_text]=simple_decraption(plan_text,key)

chars='a':'z';
plan_text=plan_text(plan_text~=' ');
plan_text=lower(plan_text);

cipher_text='';
for i=1:length(plan_text)
    indx_ch=find(key==plan_text(i));
    cipher_text(i)=chars(indx_ch);
end

end