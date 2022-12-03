function Plain_txt=Hill_Decrpt(Cipher_txt,Key)
Plain_txt='';
Cipher_txt=upper(Cipher_txt);
for I=1:26
Chars(I)=char(64+I);
end
Flage=0;
if mod(length(Cipher_txt),2)~=0
    Cipher_txt=strcat(Cipher_txt,'X');
    Flage=1;
end
Num=zeros(size(Cipher_txt));
for I=1:length(Cipher_txt)
    Ch=Cipher_txt(I);
    In=find(Chars==Ch);
    Num(I)=In-1;
end
for I=1:2:length(Num)
    Ind=[Num(I);Num(I+1)];     
    New_Ind=Key*Ind;
    New_Ind=mod(New_Ind,26);
    New_Ch=Chars(New_Ind+1);
    Plain_txt(I)=New_Ch(1);
    Plain_txt(I+1)=New_Ch(2);
end
Plain_txt=lower(Plain_txt);
if Flage==1
    Plain_txt=Plain_txt(1:length(Plain_txt)-1);
end
if Plain_txt(end)=='x'
    Plain_txt=Plain_txt(1:length(Plain_txt)-1);
end
end