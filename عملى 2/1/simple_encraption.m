function [cipher_text,key]=simple_encraption(plantext)
chars='a':'z';
plantext=lower(plantext);
plantext=plantext(plantext~=' ');

cipher_text='';
key=chars(randperm(26));
for i=1:length(plantext)
    plan_idx=find(plantext(i)==chars);
    cipher_text(i)=key(plan_idx);
end
cipher_text=upper(cipher_text);
end