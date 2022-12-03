function Plain_txt = PlayFair_Decrypt1(Cipher_txt,Key)
Chars = 'a' : 'z';
Chars(Chars == 'j' ) = 'i';

Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt(Cipher_txt ~= ' ');
Cipher_txt(Cipher_txt == 'j' ) = 'i';

Key = lower(Key);
Key = Key(Key ~= ' ');
Key(Key == 'j' ) = 'i';

Plain_txt = '';
%% Construct the 5x5 Cipher Matrix using the Key
Key_Chars = strcat( Key , Chars );
Key_Chars = unique(Key_Chars,'stable');
Chars_Mat = reshape(Key_Chars,5,5)';

%% Use X to separate the repeated Charcters in the Plain text
for I = 1 : 2 : length(Cipher_txt)
    if Cipher_txt(I) == Cipher_txt(I+1)
        Cipher_txt = strcat( Cipher_txt(1:I) , 'x' , Cipher_txt(I+1:length(Cipher_txt)));
    end
end
if mod( length(Cipher_txt) , 2 ) ~= 0
    Cipher_txt = strcat(Cipher_txt,'x');
end
%%
for I = 1 : 2 : length(Cipher_txt)
    Ch1 = Cipher_txt(I); Ch2 = Cipher_txt(I+1);
    [Row1,Col1] = find( Chars_Mat == Ch1 );
    [Row2,Col2] = find( Chars_Mat == Ch2 );
    if Row1 == Row2 %If the two characters are in the same row
        New_Col1 = mod(( Col1 - 1 ) - 1 , 5) + 1 ;
        New_Col2 = mod(( Col2 - 1 ) - 1 , 5) + 1 ;
        Plain_txt(I) = Chars_Mat(Row1 , New_Col1 );
        Plain_txt(I+1) = Chars_Mat(Row1 , New_Col2 );
    elseif Col1 == Col2 %If the two characters are in the same column
        New_Row1 = mod(( Row1 - 1 ) - 1 , 5) + 1 ;
        New_Row2 = mod(( Row2 - 1 ) - 1 , 5) + 1 ;
        Plain_txt(I) = Chars_Mat( New_Row1 , Col1 );
        Plain_txt(I+1) = Chars_Mat(New_Row2 , Col1 );              
    else
        Plain_txt(I) = Chars_Mat( Row1 , Col2);
        Plain_txt(I+1) = Chars_Mat( Row2 , Col1);
    end   
end
end