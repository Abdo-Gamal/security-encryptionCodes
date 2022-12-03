function plain_txt=Caesar_Decrypt_Key(ciphr_txt)
Chars='a':'z';
ciphr_txt=lower(ciphr_txt);
ciphr_txt=ciphr_txt(ciphr_txt~=' ');
F_plain_txt='';
for Key=1:26
    plain_txt='';
    for I=1:length(ciphr_txt)
        Ind=find(Chars==ciphr_txt(I));
        New_Ind=Ind-Key;
        if New_Ind<1
            New_Ind=New_Ind+26;
        end
        plain_txt(I)= Chars(New_Ind);
    end
    F_plain_txt(Key,:)=plain_txt;
end
disp(F_plain_txt)
end