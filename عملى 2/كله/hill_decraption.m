function [ plan_text]=hill_decraption(cipher_text,key)

chars='a':'z';
cipher_text=cipher_text(cipher_text~=' ');
cipher_text=lower(cipher_text);

key=key(key~=' ');
key=lower(key);
key_lengh=length(key);
dimn=sqrt(key_lengh);
plan_text='';
if mod(dimn,1)==0
    
 for i=1:key_lengh 
 key_index(i)=find(chars==key(i))-1;
 end
 
key_index=reshape(key_index,dimn,dimn)';
key_det=mod(det(key_index),26);

if key_det~=0 &&key_det~=13 &&mod(key_det,2)~=0
    for i=1:25
        if mod(int16(key_det)*i,26)==1
            d_inv=i;
            break;
        end
    end
    key_adj=int16(det(key_index)*inv(key_index));
    key_inv=mod(d_inv*key_adj,26);
    
    for i=1:dimn:length(cipher_text)
        cipher_char=cipher_text(i:i+dimn-1);
        for j=1:length(cipher_char)
        cipher_index(j)=find(chars==cipher_char(j))-1;
        end
        mat=double(key_inv)*cipher_index';
        mat=mod(mat,26);
        plan_text(i:i+dimn-1)=chars(mat+1);
    end
end

end

end