function [ptext] =encypt()
encypt1('hello','secret');
[ptext] =dencypt('zincs','secret');

end

function [ctext] =encypt1(ptxt,key)
chars ='a':'z';
ptxt =lower(ptxt);
ptxt=ptxt(ptxt~=' ');
ctext='';
c=length(key);
for I=1:length(ptxt)
   planind=find(chars==ptxt(I));
    keyind=find(chars==key( mod(I-1,c)+1)) - 1;
    cind=planind+keyind;
    newind=mod(cind-1,26)+1;
    ctext(I)=chars(newind);
end


end

function [ptext] =dencypt(ctext,key)
chars ='a':'z';
ctext =lower(ctext);
ctext=ctext(ctext~=' ');
ptext='';
c=length(key);
for I=1:length(ctext)
   planind=find(chars==ctext(I));
    keyind=find(chars==key( mod(I-1,c)+1)) - 1;
    cind=planind-keyind;
    newind=mod(cind-1,26)+1;
    ptext(I)=chars(newind);
end


end

function [ptext] =dencyptv(ctext,key)
chars(i,j) ;
ctext =lower(ctext);
ctext=ctext(ctext~=' ');
ptext='';
c=length(key);
for I=1:26
 for j=1:length(ctext)
 
end

end


end
