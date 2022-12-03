function Cipher_txt = Hill_Encrpt(Plain_txt,Key)
Chars = 'a':'z';
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt ~= ' ');
Key = lower(Key);
Key = Key(Key ~= ' ');

Cipher_txt = '';

Length_Key = length(Key);
Dimn = sqrt(Length_Key);
Key_Ind = zeros(1,Length_Key);
if mod( Dimn , 1 ) == 0  %% Check that Dimn is Integer
    for I = 1 : Length_Key
        Ch = Key(I);
        Key_Ind(I) = find(Chars == Ch) - 1;
    end
    Key_Ind = reshape(Key_Ind, Dimn , Dimn)';
    Det_Key = mod( det(Key_Ind) , 26 );
    if mod(Det_Key , 2) ~= 0 && Det_Key ~= 0 && Det_Key ~= 13
        while mod(length(Plain_txt), Dimn ) ~=0
            Plain_txt = strcat(Plain_txt,'x');
        end
        for I = 1 : Dimn : length(Plain_txt)
            Plain_Chars = Plain_txt(I:I+Dimn-1);
            for J = 1 : length( Plain_Chars )
                Plain_Ind(J) = find(Chars == Plain_Chars(J)) - 1;            
            end
            Cipher_Ind = Key_Ind * Plain_Ind';
            Cipher_Ind = mod(Cipher_Ind,26);
            Cipher_txt(I:I+Dimn-1) = Chars(Cipher_Ind + 1);
        end
        Cipher_txt = upper(Cipher_txt);
        
    else
        disp('Error...');
    end
    
else
    disp('Error...');
end  
end