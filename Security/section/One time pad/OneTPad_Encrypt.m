function Ciphr_txt=OneTPad_Encrypt(Plain_txt,Key)
Plain_txt=lower(Plain_txt);
Key=lower(Key);
Ciphr_txt=Plain_txt;
% Chars='a':'z';
% J=1;
% Find the ASCII equivalent
% Plain_AscII = double(Plain_txt);
Plain_AscII=double(lower(Plain_txt)-96);
Key_AscII=double(lower(Key)-96);
% Key_AscII = double(Key);
Cipher_AscII=zeros(size(Key_AscII));
% Convert to string and flip it
% Plain_encoded = fliplr(num2str(Plain_AscII));
% Key_encoded = fliplr(num2str(Key_AscII));
for I=1:length(Plain_txt)
    if Plain_txt(I)~=' '
        if Plain_AscII(I) >= 1 && Plain_AscII(I) <= 26
            Cipher_AscII(I)=bitxor(Plain_AscII(I),Key_AscII(I));
        
        end
%         cf1 = fliplr(Plain_encoded);
%         cf2 = fliplr(Key_encoded);       
%         n1 = str2num(cf1); % Find ASCII equivalents
%         decoded = char(n1); % Convert to ASCII
%         n2 = str2num(cf2); % Find ASCII equivalents
%         decoded = char(n2); % Convert to ASCII

%         ciphr_txt(I)=char(C(I));
%     key_Ind=reshape(dec2bin(key(I), 7)-'0',1,[]);
%     New_Ind=bitxor(Ind,key_Ind);
%     Ind= reshape(dec2bin(plain_txt(I), 7)-'0',1,[]);
%     Ind=find(Chars==Plain_txt(I));
%     Key_Ind=find(Chars==Key(I));
%     Ind=dec2bin(double(Plain_txt(I)), 8);
%     Key_Ind=dec2bin(double(Key(I)), 8);
%     New_Ind=bitxor(double(Ind),double(Key_Ind));
%     C(I)=bin2dec(char(New_Ind+'0'));
 
%     ciphr_txt(I)= char(bin2dec(reshape(char(New_Ind+'0'), 7,[]).'));

%     J=J+1;
    end
    
end
ciphr_txt = char(Cipher_AscII+96);
% ciphr_txt=upper(ciphr_txt);
end


