function [Cipher_txt] = OTPadXor_Encrypt(Plain_txt,Key)
Cipher_txt = ''; 
if (length(Key) == length(Plain_txt))
    for I = 1 : length(Plain_txt)
        Plain_Dec = double( Plain_txt(I) );            
        Key_Dec = double( Key(I) );
        Cipher_Dec = bitxor(Plain_Dec,Key_Dec);         
        Cipher_txt(I) = char(Cipher_Dec);
    end    
else
  disp('Plain_txt and Key must be of the same length')  
end 
end

% [~,~]=OTPadXor_Encrypt(Plain_txt,Key)
        %         Pl_Bin = dec2bin(Pl_Dec,8);
%         Key_Bin = dec2bin(Key_Dec,8);
% Cipher_Hex = mat2str(dec2hex(Cipher_Dec,2));
%     Cipher_txt = char(Cipher_Dec);
    %         Cipher_Dec=bin2dec(char(Cipher_Bin+'0'));
%         Cipher_Dec(I)=bin2dec(num2str(Cipher_Bin));
