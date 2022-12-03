function [Cipher_txt] = OTPadXor_Encrypt(Plain_txt,key)

Plain_txt=Plain_txt(Plain_txt~=' ');
key=key(key~=' ');
 Cipher_txt='';
if length(key)==length(Plain_txt)
    for i=1:length(Plain_txt)
        
        plan_dec=double( Plain_txt(i) );
        key_dec=double( key(i) );
        new_dec=bitxor( key_dec,plan_dec );
        Cipher_txt(i)=char(new_dec);
        
    end
 else
   disp("dfdf fdfdff ffd")
end 
Cipher_txt=upper(Cipher_txt);
end