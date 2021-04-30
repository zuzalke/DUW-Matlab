function F = Wiezy(Q_TEMP, ParyObrotowe, ParyPostepowe, ~, WymPostepowe, T_TEMP)
    %Funkcja wyznaczaj�ca warto�ci funkcji opisuj�cych wi�zy
 
    %Zadeklarowanie wektora wyj�ciowego
    F = zeros(length(Q_TEMP),1);
    Pozycja = 1;

    %Stworzenie r�wna� dla par obrotowych
    for i = 1:(size(ParyObrotowe,1))
        [R1, ~, Rot1] = Polozenia(Q_TEMP,ParyObrotowe(i,1));
        [R2, ~, Rot2] = Polozenia(Q_TEMP,ParyObrotowe(i,2));
        sA = ParyObrotowe(i,3:4)';
        sB = ParyObrotowe(i,5:6)';
 
        %Wz�r 2.16 w skrypcie z wyk�adu
        F(Pozycja:Pozycja+1,1) = R1 + Rot1 * sA - (R2 + Rot2 * sB);
        
        Pozycja = Pozycja + 2;
    end

    %Stworzenie r�wna� dla par post�powych 
    for i = 1:(size(ParyPostepowe,1))
        [R1, Fi1, Rot1] = Polozenia(Q_TEMP,ParyPostepowe(i,1));
        [R2, Fi2, Rot2] = Polozenia(Q_TEMP,ParyPostepowe(i,2));  
       
        Fi0 = ParyPostepowe(i,3);
        sA = ParyPostepowe(i,6:7)';
        sB = ParyPostepowe(i,8:9)';
        U = ParyPostepowe(i,4:5)';
        V = [-U(2); U(1)];

        %Wz�r 2.17
        F(Pozycja,1) = Fi1 - Fi2 - Fi0;
        
        %Wz�r 2.20
        F(Pozycja+1,1) = (Rot2 * V)'*(R2 - R1 - Rot1 * sA) + V' * sB;
        
        Pozycja = Pozycja + 2;
    end

    %Gdyby w zadaniu by�y wymuszenia obrotowe to powinien znale�� si� tu kod kt�ry by
    %co� z nimi robi�, ale ich nie ma

    %Stworzenie r�wna� dla wymusze� post�powych
    for i = 1:(size(WymPostepowe,1))
        [R1,~,Rot1] = Polozenia(Q_TEMP,ParyPostepowe(WymPostepowe(i,1),1));
        [R2,~,Rot2] = Polozenia(Q_TEMP,ParyPostepowe(WymPostepowe(i,1),2));
        U = ParyPostepowe(WymPostepowe(i,1),4:5)';
        sA = ParyPostepowe(WymPostepowe(i,1),6:7)';
        sB = ParyPostepowe(WymPostepowe(i,1),8:9)';
        
        % wzor 2.26 na wymuszenie w parze postepowej
        F(Pozycja,1) = (Rot2 * U)'*(R2 + Rot2 * sB - R1 - Rot1 * sA) - WymuszenieP(WymPostepowe(i,2),0,T_TEMP,ParyPostepowe, WymPostepowe);
        
        Pozycja = Pozycja + 1;
    end
end

