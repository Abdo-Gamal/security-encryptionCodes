function plain_txt=Caesar_Decrypt_K(ciphr_txt,key)
Chars='a':'z';
plain_txt=ciphr_txt;
ciphr_txt=lower(ciphr_txt);
Chr=find(plain_txt~=' ');

for I=1:length(Chr)
Ind=find(Chars==ciphr_txt(Chr(I)));
New_In=Ind-key;
if New_In<1
    New_In=mod(New_In,26);
end
plain_txt(Chr(I))= Chars(New_In);
end
plain_txt=lower(plain_txt);
end
% for I=1:length(ciphr_txt)
% for J=1:length(Chars)
% if ciphr_txt(I)==Chars(J)
%   New_Inex=J-key;
%   if New_Inex<1
%      New_Inex=New_Inex+26;
% %       New_Inex=mod(New_Inex,+26;
%   end
%     plain_txt(I)= lower(Chars(New_Inex));
%      break;
% end
% end
% end
% end