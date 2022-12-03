function Plain_txt=OTPadXor_Decrypt(Cipher_txt,Key)
diff=length(Key)-length(Cipher_txt);
if diff==0
    Cipher_txt=lower(Cipher_txt);
    Key=lower(Key);
    Cipher_txt=Cipher_txt(Cipher_txt~=' ');
    Plain_txt='';   
    for I=1:length(Cipher_txt)
        Ciphr_Dec=double(Cipher_txt(I));            
        Key_Dec=double(Key(I));
        Ciphr_Bin=dec2bin(Ciphr_Dec,8);
        Key_Bin=dec2bin(Key_Dec,8);
        Pl_Bin= bitxor(double(Ciphr_Bin),double(Key_Bin));  
        Pl_Dec=bin2dec(char(Pl_Bin+'0'));
        Plain_txt(I)=char(Pl_Dec);
    end
else
    Plain_txt=' ';
    disp('Cipher_txt and Key must be of the same length')
end
end