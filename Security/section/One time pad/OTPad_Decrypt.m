function Plain_txt=OTPad_Decrypt(Cipher_txt,Key)
Cipher_txt=upper(Cipher_txt);
Key=upper(Key);
for I=1:26
Chars(I)=char(64+I);
end
Num=zeros(size(Cipher_txt));
for I=1:length(Cipher_txt)
    Ch_Cipher=Cipher_txt(I);
    In=find(Chars==Ch_Cipher);
    Num_Cipher=In-1;
    Ch_Key=Key(I);
    In=find(Chars==Ch_Key);
    Num_Key=In-1;
    Num(I)=Num_Cipher-Num_Key;
    if Num(I)<0
       Num(I)=mod(Num(I),26);% or Num(I)=Num(I)+26; 
    end
    Plain_txt(I)=Chars(Num(I)+1);
end
Plain_txt=lower(Plain_txt);
end