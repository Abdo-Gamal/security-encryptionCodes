function Cipher_txt=OTPadXor_Rand_Encrypt(Plain_txt)
    Plain_txt=lower(Plain_txt);
%     N=length(Plain_txt);
%     Key = [zeros(1,N/2), ones(1,N/2)];
%     Key = Key(randperm(2*N));
%     Key = repmat([0 1], 1, N);
    Key = randi(2,1,length(Plain_txt)) - 1;
    Plain_txt=Plain_txt(Plain_txt~=' ');
    Cipher_txt='';
    
    for I=1:length(Plain_txt)
        Pl_Dec=double(Plain_txt(I));            
        Key_Dec=double(Key(I));
        Pl_Bin=dec2bin(Pl_Dec,8);
        Key_Bin=dec2bin(Key_Dec,8);
        Cipher_Bin= bitxor(double(Pl_Bin),double(Key_Bin));  
%         Cipher_Dec=bin2dec(char(Cipher_Bin+'0'));
        Cipher_Dec=bin2dec(num2str(Cipher_Bin));
        Cipher_txt(I)=char(Cipher_Dec);
    end
end