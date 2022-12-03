
function [cipher_text]= PlayFair_encraption(plan_text,key)
chars = 'a' : 'z';
chars(chars == 'j' ) = 'i';

plan_text = lower(plan_text);
plan_text = plan_text(plan_text ~= ' ');
plan_text(plan_text == 'j' ) = 'i';

key = lower(key);
key = key(key ~= ' ');
key(key == 'j' ) = 'i';

%constract 5*5 matrax for key
key_chars=strcat(key,chars);
key_chars=unique(key_chars,'stable')
mat_chars=reshape(key_chars,5 ,5)';
cipher_text='';
% Use X to separate the repeated Charcters in the Plain text

for i=1:2:length(plan_text)-1
    if(plan_text(i)==plan_text(i+1))
        plan_text=strcat( plan_text(1:i),'x',plan_text(i+1:length(plan_text)) );
    end
end
if(mod(length(plan_text),2)~=0)
     plan_text= strcat( plan_text,'x');
end

for i=1:2:length(plan_text)
    ch1=plan_text(i);
    ch2=plan_text(i+1);
    [r1,c1]=find(mat_chars==ch1);
        [r2,c2]=find(mat_chars==ch2);
    if(r1==r2)
            cipher_text(i)=mat_chars(r1,mod(c1+1-1,5)+1);
        cipher_text(i+1)=mat_chars(r2,mod(c2+1-1,5)+1);
      
    elseif(c1==c2)
       cipher_text(i)=mat_chars(mod(r1+1-1,5)+1,c1);
        cipher_text(i+1)=mat_chars(mod(r2+1-1,5)+1,c2);
    else 
          cipher_text(i)=mat_chars(r1,c2);
        cipher_text(i+1)=mat_chars(r2,c1);
    end
    
end
cipher_text = upper(cipher_text);
end