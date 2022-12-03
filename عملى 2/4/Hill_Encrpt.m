function Cipher_txt = Hill_Encrpt(Plain_txt,key)
chars = 'a':'z';
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt ~= ' ');
Key = lower(key);
key = key(key ~= ' ');
len_key=length(key);
dimn = sqrt(len_key);
Cipher_txt='';
if mod( dimn , 1 ) == 0  %% Check that Dimn is Integer
  
    for i=1:len_key
        key_index(i)=find(chars==key(i))-1;
    end
   key_index=reshape(key_index,dimn,dimn)';
    key_det=mod(det(key_index),26);
    if key_det~=0&&mod(key_det,2)~=0&&key_det~=13
        
        for i=1:dimn:length(Plain_txt)
            plan_char=Plain_txt(i:i+dimn-1);
              for j=1:length(plan_char)
                plan_indx(j)=find(plan_char(j)==chars)-1;
              end
               Cipher_Ind=key_index*plan_indx';
               Cipher_Ind=mod(Cipher_Ind,26);
               Cipher_txt(i:i+dimn-1)=chars(Cipher_Ind+1);
        end
    end
    
else 
    disp("erors")
end
end
 