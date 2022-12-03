function Plain_txt = Hill_Decrpt(Cipher_txt,key)
chars = 'a':'z';
Cipher_txt = lower(Cipher_txt);
Cipher_txt = Cipher_txt(Cipher_txt ~= ' ');
key = lower(key);
key = key(key ~= ' ');
Plain_txt = '';
Length_Key = length(key);
dimn = sqrt(Length_Key);

key_idx=zeros(1,Length_Key);% not  import
for i=1:Length_Key
    key_idx(i)=find(chars==key(i))-1;
end
key_idx=reshape(key_idx,dimn,dimn)';

key_det=mod(det(key_idx),26);%double
 for i=1:25
    if mod(int32(key_det)*i,26)==1
           Det_Inv=i;
           break;
    end
 end
adj_key=int16(det(key_idx)*inv(key_idx));%double
key_inv=mod(Det_Inv*adj_key,26);%double

for i=1:dimn:length(Cipher_txt)
  cipher_char=Cipher_txt(i:i+dimn-1);
       for j=1:length(cipher_char)
        cipher_index(j)=find(chars==cipher_char(j))-1;
       end
        plan_indx=double(key_inv)*cipher_index';
        plan_ind_mod=mod(plan_indx,26);
        Plain_txt(i:i+dimn-1)=chars(plan_ind_mod+1);
        
end

end



