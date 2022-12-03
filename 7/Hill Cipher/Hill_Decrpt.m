function Plain_txt = Hill_Decrpt(Cipher_txt,Key)
Chars = 'a':'z';
Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt(Cipher_txt ~= ' ');
Key = lower(Key);
Key = Key(Key ~= ' ');
Plain_txt = '';

Length_Key = length(Key);
Dimn = sqrt(Length_Key);
Key_Ind = zeros(1,Length_Key);
for I = 1 : Length_Key
    Ch = Key(I);
    Key_Ind(I) = find(Chars == Ch) - 1;
end
Key_Ind = reshape(Key_Ind, Dimn , Dimn)';
Det_Key =  mod( det(Key_Ind) , 26 ) ;   
for I = 1 : 25
    if mod( int16(Det_Key) * I , 26) ==1
        Det_Inv = I;
        break;
    end
end
Adj_Key = int16( det(Key_Ind) * inv(Key_Ind) );
Inv_Key = mod( Det_Inv * Adj_Key , 26);
for I = 1 : Dimn : length(Cipher_txt)
    Cipher_Chars = Cipher_txt(I : I+Dimn-1);
    for J = 1 : length( Cipher_Chars )
        Cipher_Ind(J) = find(Chars == Cipher_Chars(J)) - 1;            
    end
    Plain_Ind = double(Inv_Key) * Cipher_Ind';
    Plain_Ind = mod(Plain_Ind,26);
    Plain_txt(I:I+Dimn-1) = Chars(Plain_Ind + 1);
end             
end
