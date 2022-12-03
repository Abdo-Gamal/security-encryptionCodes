function [cipher_text]=OTPadXor_Encrypt(plan_text,key)
chars='a':'z';
plan_text=plan_text(plan_text~=' ');
key=key(key~=' ');
cipher_text='';
if length(plan_text)== length(key)
    
for i=1:length(plan_text)
   ch_ascii= double(plan_text(i));
   ky_ascii=double(key(i));
   new_ass=bitxor(ch_ascii,ky_ascii);
  cipher_text(i)=char(new_ass);
end
end
end