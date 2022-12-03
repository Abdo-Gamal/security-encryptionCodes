function Plain_txt = Caesar_Decrypt(Cipher_txt,key)
Chars = 'a':'z';
Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt( Cipher_txt ~= ' ' );
Plain_txt = Cipher_txt;

for I = 1:length(Cipher_txt)
    Ciphr_Ind = find(Chars == Cipher_txt(I));
    Plain_Ind = Ciphr_Ind - key;
    if Plain_Ind < 1
        Plain_Ind = mod(Plain_Ind,26);
    end
    Plain_txt(I) = Chars(Plain_Ind);
end

Plain_txt = lower(Plain_txt);

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