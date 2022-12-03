function Cipher_txt=OTPad(Plain_txt,Key)
Key=upper(Key);
for I=1:26
Chars(I)=char(64+I);
end
diff=length(Key)-length(Plain_txt);
Flage=0;
if diff~=0
    for i=1:diff
        Plain_txt=strcat(Plain_txt,'x');
    end
    Flage=1;
end
Plain_txt=upper(Plain_txt);
Num=zeros(size(Plain_txt));
for I=1:length(Plain_txt)
    Ch_Plain=Plain_txt(I);
    In=find(Chars==Ch_Plain);
    Num_Plain=In-1;
    Ch_Key=Key(I);
    In=find(Chars==Ch_Key);
    Num_Key=In-1;
    Num(I)=Num_Plain+Num_Key;
    if Num(I)>25
       Num(I)=mod(Num(I),26);% or Num(I)=Num(I)-26; 
    end
    Cipher_txt(I)=Chars(Num(I)+1);
end
if Flage==1
    Cipher_txt=Cipher_txt(1:length(Cipher_txt)-diff);
end
end