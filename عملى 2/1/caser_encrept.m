function cipher_text=caser_encrept(pantext,key)
Chars='a':'z';
pantext=lower(pantext);
pantext=pantext(pantext~=' ');
cipher_text='';
for i=1:length(pantext)
    
   pan_indx=find(Chars==pantext(i));
   new_idx=mod(pan_indx+key-1,26)+1;
   cipher_text(i)=Chars(new_idx);
end
cipher_text=upper(cipher_text);
end 