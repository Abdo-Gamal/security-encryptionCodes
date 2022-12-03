function Cipher_txt=Hill_Encrpt(Plain_txt,Key)
Cipher_txt='';
for I=1:26
Chars(I)=char(64+I);
end
Flage=0;
if mod(length(Plain_txt),2)~=0
    Plain_txt=strcat(Plain_txt,'X');
    Flage=1;
end
Plain_txt=upper(Plain_txt);

Num=zeros(size(Plain_txt));
for I=1:length(Plain_txt)
    Ch=Plain_txt(I);
    In=find(Chars==Ch);
    Num(I)=In-1;
end
for I=1:2:length(Num)
    Ind=[Num(I);Num(I+1)];     
    New_Ind=Key*Ind;
    New_Ind=mod(New_Ind,26);
    New_Ch=Chars(New_Ind+1);
%     Ind1=find(N_Chars==New_Ind(1));
%     Ind2=find(N_Chars==New_Ind(2));
%     New_Ch1=Chars(Ind1);
%     New_Ch2=Chars(Ind2);
    Cipher_txt(I)=New_Ch(1);
    Cipher_txt(I+1)=New_Ch(2);
end
% if Flage==1
%     Cipher_txt=Cipher_txt(1:length(Cipher_txt)-1);
% end
end
%     k=find(New_Ind==0);
%     if ~isempty(k)
%       New_Ind(k)=26;
%     end