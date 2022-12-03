function [Cipher_txt] = payfair(Plain_txt,key)
Chars = 'a' : 'z';
Plain_txt = lower(Plain_txt);
Plain_txt = Plain_txt(Plain_txt ~= ' ');
key = lower(key);
key = key(key ~= ' ');

ind=find(key=='j');
key(ind)='i';
Chars = Chars(Chars ~= 'j');
newkey=strcat(key,Chars);
newkey=unique(newkey,'stable');

mat=char(zeros(5,5)); 
ii=1;
for i=1:5
    for j=1:5
        mat(i,j)=newkey(ii);
        ii=ii+1;
    end
end

if(mod(length(Plain_txt),2)>0)
    strcat( Plain_txt,'x');
end
Cipher_txt = "";

for i=1:2:length(Plain_txt)
    c1=Plain_txt(i);
    c2=Plain_txt(i+1);
  if(c1==c2)
   Plain_txt=strcat(Plain_txt(1:i),'x',Plain_txt(i+1:end));
  end
  c1=Plain_txt(i);
  c2=Plain_txt(i+1);
  [row1,col1]=find(mat==c1);
  [row2,col2]=find(mat==c2);
if (row1==row2)
    Cipher_txt=Cipher_txt+mat(row1,mod(col1+1-1,5)+1);
     Cipher_txt=Cipher_txt+mat(row1,mod(col2+1-1,5)+1);

else if (col1==col2)
    Cipher_txt=Cipher_txt+mat(mod(row1+1-1,5)+1,col1);
     Cipher_txt=Cipher_txt+mat(mod(row1+1-1,5)+1,col1);
     
 else 
    Cipher_txt=Cipher_txt+mat(row1,col2);
     Cipher_txt=Cipher_txt+mat(row2,col1);

end
end



end