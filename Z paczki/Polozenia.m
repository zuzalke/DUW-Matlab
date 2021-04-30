function [R, Fi, Roti] = Polozenia(Q,indeks)
    %Funkcja pobieraj�ca aktualne wsp�rz�dne 

    if(indeks == 0) %Dla podstawy
        R = [0;0]; Fi = 0; Roti = Rot(Fi);
    else
        R = Q(3*indeks-2:3*indeks-1);
        Fi = Q(3*indeks);
        Roti = Rot(Fi);
    end
end

