function F=Fi(q,t);
%ALERT PLIK NIEDOKONCZONY - BRAK ROWNAN DLA PAR POSTEPOWYCH!

 temp = fopen('Dane/ParyObrotowe.txt', 'r');
 nobr = str2num(fgetl(temp));
 
 temp = fopen('Dane/ParyPostepowe.txt', 'r');
 npos = str2num(fgetl(temp));
 
 k=0                         %licznik równań więzów
 F=zeros(2*(nobr+npos),1)    %deklaracja rozmiaru wektora
    
   
 for m=1:nobr
        i=3*RevoluteJoint(m,1);
        j=3*RevoluteJoint(m,2);
        if i == 0
            F(k+1:k+2,1)=RevoluteJoint(m,3:4)-q(j-2:j-1,1)-Rot(q(j))*RevoluteJoint(m,5:6);
        elseif j == 0
            F(k+1:k+2,1)=q(i-2:i-1,1)+Rot(q(i))*RevoluteJoint(m,3:4)-RevoluteJoint(m,5:6);
        else
            F(k+1:k+2,1)=q(i-2:i-1,1)+Rot(q(i))*RevoluteJoint(m,3:4)-q(j-2:j-1,1)-Rot(q(j))*RevoluteJoint(m,5:6);
        end
        k=k+2;
 end
 %NIE WIEM CO ROBIĘ I CZY TO JEST DOBRZE - NIEKSONCZONE (NIE WIEM, JAK
 %OPISAĆ WIĘZY PAR POSTĘPOWYCH)
 for m=1:npos
        i=3*PrismaticJoint(m,1);
        j=3*PrismaticJoint(m,2);
        if i == 0
            F(k+1,1)=
            F(k+2,1)=
        elseif j == 0
            F(k+1,1)=
            F(k+2,1)=
        else
            F(k+1,1)=
            F(k+2,1)=
        end
        k=k+2;
 end
      