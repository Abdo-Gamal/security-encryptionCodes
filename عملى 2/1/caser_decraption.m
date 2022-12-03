function [plantext]= caser_decraption(ciphertext,key)
chars='a':'z';
ciphertext=lower(ciphertext);
ciphertext=ciphertext(ciphertext~=' ');

plantext='';
for i=1:length(ciphertext)
    cipher_indx=find(chars==ciphertext(i));
    new_idx=mod(cipher_indx-key-1,26)+1;
    plantext(i)=chars(new_idx);
end 

end