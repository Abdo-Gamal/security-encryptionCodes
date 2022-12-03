function [cipher_text]=hill_encraption(plan_text,key)
chars='a':'z';
plan_text=plan_text(plan_text~=' ');
plan_text=lower(plan_text);

key=key(key~=' ');
key=lower(key);
key_lengh=length(key);
dimn=sqrt(key_lengh);
cipher_text='';
if mod(dimn,1)==0
     
    for i=1:key_lengh
        key_index(i)=find(chars==key(i))-1;
    end
    key_index=reshape(key_index,dimn,dimn)';
   while mode(length(plan_text),dimn)==0
       plan_text=strcat(plan_text,'x');
   end
   
    key_det=mod(det(key_index),26);
    if key_det~=0 && key_det~=13 &&mod(key_det,2)~=0
        
        for i=1:dimn:length(plan_text)
            plan_char=plan_text(i:i+dimn-1);
             for j=1:length(plan_char)
                 plan_idex(j)=find(chars==plan_char(j) )-1;
             end
             mat=key_index*plan_idex';
             mat=mod(mat,26);
             cipher_text(i:dimn+i-1)=chars(mat+1);
        end
        cipher_text=upper(cipher_text);
    end
    
end

end