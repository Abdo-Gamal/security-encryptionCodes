function Plain_txt = Dsub_Decrypt(Cipher_txt,Row_Per,Col_Per)
Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt( Cipher_txt ~= ' ' );
Plain_txt = Cipher_txt;

row = length(Row_Per);
col = length(Col_Per);
C = 1;
for I = 1:row
    for J = 1:col
        if C <= length(Cipher_txt)
            Cipher_Mat(I,J) = Cipher_txt(C);
        else
            Cipher_Mat(I,J) = 'x';
        end
        C = C + 1;
    end
end
for I = 1:row
    Permuted_Mat1(I,:)= Cipher_Mat(Row_Per(I),:);    
end
for I = 1:col
    Permuted_Mat2(:,I) = Permuted_Mat1(:,Col_Per(I));    
end

Permuted_Mat2 = Permuted_Mat2';
for I = 1:row*col
    Plain_txt(I) = Permuted_Mat2(I);
end
% Plain_txt = reshape(Permuted_Mat2',[1,length(Plain_txt)]);
end