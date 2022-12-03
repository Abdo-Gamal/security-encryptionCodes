function Cipher_txt=PlayFair_Encrpt(Plain_txt,Key)
Cipher_txt='';
Plain_txt=upper(Plain_txt);
Key=upper(Key);
for I=1:26
Chars(1,I)=char(64+I);
end
%% Use X to separate the repeated Charcters in the Plain text
for I=1:2:length(Plain_txt)
    if Plain_txt(I)==Plain_txt(I+1)
        Plain_txt=strcat(Plain_txt(1:I),'X',Plain_txt(I+1:length(Plain_txt)));
    end
end
%% Construct the 5x5 Cipher Matrix using the Key
Ciper_Mat='';
J=1;
for I=1:length(Key)
    Ch=Key(I);
    if  Ch=='J'
        Ch='I';
    end
    Ind=find(Ciper_Mat==Ch);
    if isempty(Ind)
        Ciper_Mat(J)= Ch; 
        J=J+1;
    end
end
for I=1:length(Chars)
        Ch=Chars(I);
        if  Ch=='J'
            Ch='I';
        end    
        Ind=find(Ciper_Mat==Ch);         
        if isempty(Ind)
            Ciper_Mat(J)= Ch; 
            J=J+1;
        end
end
Ciper_Mat=reshape(Ciper_Mat,[5 5])';
%% The Encryption Part
L=length(Plain_txt);
% Flage=0;
if mod(L,2)~=0
Plain_txt=strcat(Plain_txt,'X');
% Flage=1;
end
for I=1:2:length(Plain_txt)
    Ch1=Plain_txt(I); Ch2=Plain_txt(I+1);
    [r1,c1]=find(Ciper_Mat==Ch1);
    [r2,c2]=find(Ciper_Mat==Ch2);
    if r1==r2 %If the two characters are in the same row
        Rect=Ciper_Mat(r1,:);
        Col1=c1+1;  
        if Col1>length(Rect) 
            Col1=Col1-5;
        end
        New_Ch1=Rect(Col1); 
        
        Col2=c2+1;
        if Col2>length(Rect) 
            Col2=Col2-5;
        end   
        New_Ch2=Rect(Col2); 
    elseif c1==c2 %If the two characters are in the same column
        Rect=Ciper_Mat(:,c1);
        Row1=r1+1;  Row2=r2+1;
        if Row1>length(Rect) 
            Row1=Row1-5;
        end
        New_Ch1=Rect(Row1);
        if Row2>length(Rect) 
            Row2=Row2-5;
        end
        New_Ch2=Rect(Row2);
    else
        New_Ch1=Cipher_Mat(r1,c2);
        New_Ch2=Cipher_Mat(r2,c1);      
    end
    Cipher_txt(I)=New_Ch1;
    Cipher_txt(I+1)=New_Ch2;     
end
end
%         Strt_Row=min(r1,r2); Strt_Col=min(c1,c2);
%         End_Row=max(r1,r2); End_Col=max(c1,c2);
%         Rect=Ciper_Mat(Strt_Row:End_Row,Strt_Col:End_Col);
%         [r,c]=size(Rect);
%         if Ch1==Rect(1,1)
%             New_Ch1=Rect(1,c);
%         elseif Ch1==Rect(1,c)
%             New_Ch1=Rect(1,1);
%         elseif Ch1==Rect(r,1)
%             New_Ch1=Rect(r,c);
%         elseif Ch1==Rect(r,c)
%             New_Ch1=Rect(r,1);
%         end
%         
%         if Ch2==Rect(1,1)
%             New_Ch2=Rect(1,c);
%         elseif Ch2==Rect(1,c)
%             New_Ch2=Rect(1,1);
%         elseif Ch2==Rect(r,1)
%             New_Ch2=Rect(r,c);
%         elseif Ch2==Rect(r,c)
%             New_Ch2=Rect(r,1);
%         end
%      
% 
%         if K<=length(Key)
% %             if I==1 && J==1
% %                 Ciper_Mat(I,J)= Key(K); 
% %                 J=J+1;
% %             else
%                 Ind=find(Ciper_Mat==Key(K));
%                 if isempty(Ind)
%                     Ciper_Mat(I,J)= Key(K); 
%                     J=J+1;
%                 end    
% %             end
%             K=K+1; 
%         elseif L<=length(Chars)
%             Ch=Chars(L);
%             if Ch=='I' | Ch=='J'
%                 Ind=find(Ciper_Mat=='I'|Ciper_Mat=='J');
%             else
%                Ind=find(Ciper_Mat==Ch); 
%             end         
%             if isempty(Ind)
%                 Ciper_Mat(I,J)= Ch; 
%                 J=J+1;
%             end              
%             L=L+1; 
%         z=Plain_txt(I+1:length(Plain_txt));
%         Plain_txt(I+1:length(Plain_txt))=[];
%         Plain_txt(I+1)='X';
%         Plain_txt=[Plain_txt z];

% for I=1:5
%     J=1;
%     while J<=5
%         if K<=length(Key)
%             Ch=Key(K);
%             if  Ch=='J'
%                 Ch='I';
%             end
%             Ind=find(Ciper_Mat==Ch);
%             if isempty(Ind)
%                 Ciper_Mat(I,J)= Ch; 
%                 J=J+1;
%             end
%             K=K+1;
%         else
%             break;
%         end
%     end
% end
% for I=I:5
%     J=1;
%     while J<=5 
%         if L<=length(Chars)
%             Ch=Chars(L);
%             if  Ch=='J'
%                 Ch='I';
%             end    
% %                 Ind=find(Ciper_Mat=='I'|Ciper_Mat=='J');
%             Ind=find(Ciper_Mat==Ch);         
%             if isempty(Ind)
%                 Ciper_Mat(I,J)= Ch; 
%                 J=J+1;
%             end               
%             L=L+1;
%         end       
%     end
% end

% for I=1:5
%     J=1;
%     while J<=5 && K<=length(Key)
%         Ch=Key(K);
%         if  Ch=='J'
%             Ch='I';
%         end
%         Ind=find(Ciper_Mat==Ch);
%         if isempty(Ind)
%             Ciper_Mat(I,J)= Ch; 
%             J=J+1;
%         end
%         K=K+1;
%     end
%     while J<=5 && L<=length(Chars)
%         Ch=Chars(L);
%         if  Ch=='J'
%             Ch='I';
%         end    
% %                 Ind=find(Ciper_Mat=='I'|Ciper_Mat=='J');
%         Ind=find(Ciper_Mat==Ch);         
%         if isempty(Ind)
%             Ciper_Mat(I,J)= Ch; 
%             J=J+1;
%         end               
%         L=L+1;
%     end
% end
