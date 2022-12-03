function [plantext]=simple_decraption(cipher_text,key)
chars='a':'z';
cipher_text=lower(cipher_text);
cipher_text=cipher_text(cipher_text~=' ');

plantext='';
for i=1:length(cipher_text)
    plan_idx=find(cipher_text(i)==key);
    plantext(i)=chars(plan_idx);
end
end