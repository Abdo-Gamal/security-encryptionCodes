function [ plan_text]=playfair_decraption(cipher_text,key)
chars='a':'z';
chars(chars=='j')='i';
cipher_text=cipher_text(cipher_text~=' ');
cipher_text=lower(cipher_text);
key=key(key~=' ');
key=lower(key);


cipher_text(cipher_text=='j')='i';
key(key=='j')='i';

key_mat=strcat(key,chars);
key_mat=unique(key_mat,'stable');
key_mat=reshape(key_mat,5,5)';
plan_text='';
for i=1:2:length(cipher_text)-1
    ch1= cipher_text(i);
    ch2=cipher_text(i+1);
    if ch1==ch2
        cipher_text=strcat(cipher_text(1:i),'x',cipher_text(i+1,:));
    end
    
end
if mod(length(cipher_text),2)~=0
    cipher_text=strcat(cipher_text,'x');
end

for i=1:2:length(cipher_text)
   ch1= cipher_text(i);
    ch2=cipher_text(i+1);
    [r1,c1]=find(key_mat==ch1);
      [r2,c2]=find(key_mat==ch2);

      
      if r1==r2
          plan_text(i)=key_mat(r1,mod( c1-1-1,5)+1);
          plan_text(i+1)=key_mat(r2,mod( c2-1-1,5)+1);

      elseif c1==c2
          plan_text(i)=key_mat(mod( r1-1-1,5)+1,c1);
          plan_text(i+1)=key_mat(mod( r2-1-1,5)+1,c2);

          else
           plan_text(i)=key_mat(r1,c2);
          plan_text(i+1)=key_mat(r2,c1);
      
        
      end
end
end